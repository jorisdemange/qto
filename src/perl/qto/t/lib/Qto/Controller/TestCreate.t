use strict ; use warnings ; 

use Test::Most ; 
use Test::Mojo;
use Data::Printer ; 
use FindBin;
use Mojo::UserAgent;

die_on_fail ; 

BEGIN { unshift @INC, "$FindBin::Bin/../../../../../qto/lib" }

   my $tm            = '' ; # the test message for each test 
   my $res           = {} ; 
   my $url           = {} ; 
   my $exp_err_msg   = '' ; 
   my $t             = Test::Mojo->new('Qto');
   my $config     = $t->app->get('AppConfig') ; 
   my $db            = $config->{ 'postgres_db_name' } ; # because each instance has it's own ...
   my $ua            = $t->ua ; # the user agent , aka http client
   my $objTimer      = {} ;
   # the create back-end web action requires the following json format : 
   # the id which is BY DESIGN a requirement for ANY qto app table to work ... 
   # the content should be json format as follows

   $tm = 'id generated by the YYYYmmDDhhMMss timestamp can be used for new item creation' ; 
   $url = '/' . $db . '/create/test_create_table' ; 
   $objTimer          = 'Qto::App::Utils::Timer'->new( 'YYYYmmDDhhMMss' );

   my $id             = $objTimer->GetHumanReadableTime();
   ok ( $t->post_ok($url => json => {"id" =>$id})->status_is(200) , $tm );

   $tm = 'the a new row has been created with the new id: ' . $id . " with the default name " ; 
   $res = $ua->get('/' . $db . '/select/test_create_table?with=id-eq-' . $id )->result->json ; 
   ok ( $res->{'dat'}[0]->{'name'} eq 'name ...' , $tm ) ; 

   $tm = 'the a new row has been created with the new id: ' . $id . " with the default description " ; 
   ok ( $res->{'dat'}[0]->{'description'} eq 'description ...' , $tm ) ; 

   $tm = 'the ret var from the response should be the same as the http code => 200'; 
   ok ( $res->{'ret'} eq 200 , $tm ) ; 
 
   my $env = $config->{'EnvType'} . '_'; 
   $tm = 'return 400 on non_existent_db create call' ;
   $exp_err_msg = 'cannot connect to the "' . "$env" . 'non_existent_db" database: FATAL:  database "' . $env . 'non_existent_db" does not exist' ; 
   $url = '/non_existent_db/create/test_create_table' ; 
   ok ($t->post_ok($url => json => {"id"=> $id })
      ->json_is({
                 "ret" => 400 
               , "req" => 'POST http://' . $t->tx->local_address . ':' . $t->tx->remote_port .$url 
               , "msg" => "$exp_err_msg"}) , $tm );
  
   $tm = 'should return 400 on non_existent_table' ; 
   $exp_err_msg = " the table non_existent_table does not exist in the $db database " ; 
   $url = '/' . $db . '/create/non_existent_table' ; 
   ok ( $t->post_ok($url => json => {"id"=> $id+1 })
      ->json_is({"ret" => 400 , "req" => 'POST http://' . $t->tx->local_address . ':' . $t->tx->remote_port . $url , 
                 "msg" => "$exp_err_msg"}), $tm );


   $tm = 'the string "not_an_integer" should not qualify for an id ...' ; 
   $id = 'not_an_integer' ; 
   $exp_err_msg = 'the id must be a whole positive number, but not_an_integer was provided !' ;
   $url = '/' . $db . '/create/test_create_table' ; 
   ok ($t->post_ok($url => json => {"id"=> $id })
      ->json_is({"ret" => 400
            , "req" => 'POST http://' . $t->tx->local_address . ':' . $t->tx->remote_port . $url 
            , "msg" => "$exp_err_msg"
            }), $tm );

   $tm = 'the id should be a positive integer' ; 
   $id = '-1' ; 
   $exp_err_msg = 'the id must be a whole positive number, but -1 was provided !' ;
   $url = '/' . $db . '/create/test_create_table' ; 
   ok ($t->post_ok($url => json => {"id"=> $id })
      ->json_is({"ret" => 400
            , "req" => 'POST http://' . $t->tx->local_address . ':' . $t->tx->remote_port . $url 
            , "msg" => "$exp_err_msg"
        }), $tm );

done_testing();

