# src/bash/qto/funcs/mojo-morbo-start.func.sh

# v0.7.9 chk: https://github.com/mojolicious/mojo/wiki/%25ENV
doMojoMorboStart(){

   doExportJsonSectionVars $PRODUCT_INSTANCE_DIR/cnf/env/$ENV_TYPE.env.json '.env.app'
   doMojoMorboStop 0

   jwt_private_key_file=~/.ssh/qto.$ENV_TYPE.jwtRS256.key
   jwt_public_key_file=~/.ssh/qto.$ENV_TYPE.jwtRS256.key.pub
   echo << EOF
   using the following private and public key files for the Guardian's JWT's :
   $jwt_private_key_file
   $jwt_public_key_file
EOF

   test -f $jwt_private_key_file || ssh-keygen -t rsa -b 4096 -m PEM -f $jwt_private_key_file
   test -f $jwt_public_key_file && rm -v $jwt_public_key_file
   openssl rsa -in $jwt_private_key_file -pubout -outform PEM -out $jwt_public_key_file

   # to prevent the 'failed: could not create socket: Too many open files at sys' error
   # perl -e 'while(1){open($a{$b++}, "<" ,"/dev/null") or die $b;print " $b"}' to check
   ulimit -n 4096

	sleep "$sleep_interval"
   export MOJO_LOG_LEVEL='debug'
   #export MOJO_MODE='development'
   export MOJO_MODE='production'
   test -z "${mojo_morbo_port:-}" && export mojo_morbo_port='3001'

   export MOJO_LISTEN='http://*:'"$mojo_morbo_port"
   test -z "${mojo_morbo_port:-}" && export MOJO_LISTEN='http://*:3001'
   
   doLog "INFO running: morbo -w $PRODUCT_INSTANCE_DIR/src/perl/script/qto
      --listen $MOJO_LISTEN $PRODUCT_INSTANCE_DIR/src/perl/qto/script/qto"

   while read -r p ; do 
      p=$(echo $p|sed 's/^ *//g')
      test $p -ne $$ && kill -9 $p ; 
   done < <(sudo ps -ef | grep -v grep | grep 'mojo-morbo-start'|awk '{print $2}')

   bash -c "morbo -w $PRODUCT_INSTANCE_DIR/src/perl/qto --listen $MOJO_LISTEN $PRODUCT_INSTANCE_DIR/src/perl/qto/script/qto" &

   # might require sudo visudoers 
   # usrqtoadmin ALL=(ALL) NOPASSWD: /bin/netstat -tulpn
	doLog "INFO check with netstat, running netstat -tulpn" ; netstat -tulpn | grep qto
 
}
