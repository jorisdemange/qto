package Qto::Controller::Export ;
use strict ; use warnings ; 

require Exporter;
our @ISA = qw(Exporter Mojo::Base Qto::Controller::BaseController);
our $AUTOLOAD =();
our $ModuleDebug = 0 ; 
use AutoLoader;

use parent qw(Qto::Controller::BaseController);

use Data::Printer ; 
use Carp qw /cluck confess shortmess croak carp/ ;

use Qto::App::Utils::Logger;
use Qto::App::IO::In::CnrUrlPrms ; 
use Qto::App::IO::WtrExportFactory ; 
use Qto::App::Utils::Timer ; 

our $appConfig      = {};
our $objLogger      = {} ;


#
# --------------------------------------------------------
# Export all the items according to the "as" url param output type
# --------------------------------------------------------
sub doExportItems {

   my $self             = shift;
   my $db               = $self->stash('db');
   my $item             = $self->stash('item');
   my $table            = $item ; 
   my $ret              = 1 ; 
   my $msg              = 0 ; 
   my $msr2             = {}  ; 
   my $file_to_export   = '/tmp/non-existent-file-to-export.tmp' ; 
   my $http_method      = 'GET' ; 
   my $met              = '' ; 
   my $cnt              = '' ; 
   my $dat              = '' ; 

   $db = $self->SUPER::doResolveDbName ( $db ) ; 
   return unless ( $self->SUPER::isAuthorized($db) == 1 );
   $self->SUPER::doReloadProjDbMeta( $db ) ;
   $appConfig		 		= $self->app->get('AppConfig');
 
   my $as               = 'xls' ; # the default form of the Export control 
   $as = $self->req->query_params->param('as') || $as ; # decide which type of list page to build

   my $objModel         = 'Qto::App::Mdl::Model'->new ( \$appConfig , $db , $table ) ;
   my $objCnrUrlPrms    = 'Qto::App::IO::In::CnrUrlPrms'->new(\$appConfig , \$objModel , $self->req->query_params);

   my $pg_size = $self->req->query_params->param('pg-size') || 100000 ; 
   $objModel->set('select.web-action.pg-size' , $pg_size );  
 
   return $self->SUPER::doRenderJSON($objCnrUrlPrms->get('http_code'),$objCnrUrlPrms->get('msg'),$http_method,$met,$cnt,$dat) 
      unless $objCnrUrlPrms->doValidateAndSetHSelect();

   my $objExportFactory = 'Qto::App::IO::WtrExportFactory'->new(\$appConfig, \$objModel , $as );
   my $objExporter      = $objExportFactory->doSpawn( $as );
   $objExporter->doExport( $db , $table ) ; 
   ($ret , $msg , $file_to_export ) = $objExporter->doExport( $db , $table ) ;

   unless ( $ret == 0 ) {
      $self->render('text' => "$msg" );
   } else {
      $self->render_file('filepath' => "$file_to_export" ); 
   }
}



1;

__END__
