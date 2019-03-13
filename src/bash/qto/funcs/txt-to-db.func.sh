# src/bash/qto/funcs/txt-to-db.func.sh

# v1.0.9
# ---------------------------------------------------------
# 
# ---------------------------------------------------------
doTxtToDb(){

	doLog "DEBUG START doTxtToDb"
	
	# cat doc/txt/qto/funcs/txt-to-db.func.txt
   test -z ${items_order_by_attribute+x} && export items_order_by_attribute=prio
   test -z ${period+x} && export period=daily
	sleep "$sleep_interval"
	# add your action implementation code here ... 
	# Action !!!

   # run with pre-defined in the shell prjoject 
   doLog "INFO START testing txt-to-db"
   perl src/perl/qto/script/qto.pl --do txt-to-db --tables $tables
   export exit_code=$?
   doLog "INFO doRunQto exit_code $exit_code"
   test $exit_code -ne 0 && doExit $exit_code "failed to run txt-to-db action for qto"  


   psql -d "$postgres_db_name" -c '
   SELECT guid , category , name , start_time , stop_time
   FROM '"$period"'_issues order by '"$items_order_by_attribute"'
   ;';


	doLog "DEBUG STOP  doTxtToDb"
}
# eof func doTxtToDb


# eof file: src/bash/qto/funcs/txt-to-db.func.sh