package IssueTracker::Controller::List ; 
use strict ; use warnings ; 
use Mojo::Base 'Mojolicious::Controller';

use Data::Printer ; 
use Data::Dumper; 
use Scalar::Util qw /looks_like_number/;

use IssueTracker::App::Utils::Logger;
use IssueTracker::Controller::PageFactory ; 
use IssueTracker::App::IO::In::RdrUrlParams ; 
use IssueTracker::App::Db::In::RdrDbsFactory;
use IssueTracker::App::Cnvr::CnrHsr2ToArray ; 
use IssueTracker::App::UI::WtrUIFactory ; 
use IssueTracker::Controller::ListCloud ; 
use IssueTracker::Controller::ListLabels ;

our $module_trace   = 0 ; 
our $appConfig      = {};
our $objLogger      = {} ;


#
# --------------------------------------------------------
# list all the items according to the "as" url param output type
# --------------------------------------------------------
sub doListItems {

   my $self             = shift;
   
   my $item             = $self->stash('item');
   my $db               = $self->stash('db');

   my $ret              = 1 ; 
   my $msg              = '' ; 
   my $as               = 'table' ; # defines the form of the list control 
   my $list_control     = '' ; 
   my $refObjModel      = {} ; 

	print "List.pm ::: url: " . $self->req->url->to_abs . "\n\n" if $module_trace == 1 ; 
   $as = $self->req->query_params->param('as') || $as ; # decide which type of list page to build
   ( $ret , $msg , $refObjModel)  = $self->doSetRequestModelData( $item , $db ) ; 

   if ( $ret == 0 ) {
      ( $ret , $msg , $list_control ) = $self->doBuildListControl ( $msg , $refObjModel , $as  ) ; 
   } else {
      $list_control = '' ; 
   }
   $self->doSetHtmlHeaders() ;
   $msg = $self->doSetPageMsg ( $ret , $msg ) ; 
   $self->doRenderPageTemplate( $as , $msg , $db , $item , $list_control ) ; 
}


sub doSetPageMsg {

   my $self       = shift ; 
   my $ret        = shift ; 
   my $msg        = shift ; 

   $msg = '<span id="spn_err_msg">' . $msg . '</span>' unless $ret == 0 ; 
   $msg = '<span id="spn_msg">' . $msg . '</span>' if $ret == 0 ; 

   $self->res->code(400) unless $ret == 0 ; 

   return $msg ; 
}


sub doSetRequestModelData {

   my $self             = shift ; 
   my $item             = shift ; 
   my $db               = shift ; 
   
   my $ret              = 1 ;  
   my $msg              = '' ; 
   my $objRdrUrlParams  = {} ; 
   my $objModel         = {} ; 

   $appConfig		 		= $self->app->get('AppConfig');
   $objModel            = 'IssueTracker::App::Mdl::Model'->new ( \$appConfig ) ;

   $objModel->set('postgres_db_name' , $db ) ; 
   $objModel->set('table_name' , $item ) ; 

   $objRdrUrlParams   = 'IssueTracker::App::IO::In::RdrUrlParams'->new();
   ( $ret , $msg ) = $objRdrUrlParams->doSetListUrlParams(\$objModel, $self->req->query_params );
   return ( $ret , $msg ) unless $ret == 0 ; 

   ( $ret , $msg ) = $objRdrUrlParams->doSetSelectUrlParams(\$objModel, $self->req->query_params );
   return ( $ret , $msg ) unless $ret == 0 ; 

   ( $ret , $msg ) = $objRdrUrlParams->doSetWithUrlParams(\$objModel, $self->req->query_params );

   return ( $ret , $msg , \$objModel) ; 
}


sub doBuildListControl {

   my $self             = shift ; 
   my $msg              = shift ; 
   my $objModel         = ${ shift @_ } ; 
   my $as               = shift ; 

   my $ui_type          = 'page/list-lbls' ; 
   my $ret              = 1 ; 
   my $list_control     = '' ; 
   my $objPageBuilder   = {} ; 
   my $objPageFactory   = {} ; 

   my $lables_pages = { 
         'lbls'   => 'list-labels'
      ,  'cloud'  => 'list-cloud' 
      ,  'table'  => 'list-grid'
   };
   $ui_type = 'page/' . $lables_pages->{ $as } ; 

   $objPageFactory                  = 'IssueTracker::Controller::PageFactory'->new(\$appConfig, \$objModel );
   $objPageBuilder                  = $objPageFactory->doInstantiate( $ui_type );
   ( $ret , $msg , $list_control )  = $objPageBuilder->doBuildListControl( $msg , \$objModel , $as ) ;

	# print "list_control : $list_control \n" ; #todo:ysg

   return ( $ret , $msg , $list_control ) ; 

}


sub doSetHtmlHeaders {

   my $self       = shift ; 

   $self->res->headers->accept_charset('UTF-8');
   $self->res->headers->accept_language('fi, en');

}


sub doRenderPageTemplate {
   
   my $self          = shift ; 
   my $as            = shift ; 
   my $msg           = shift ; 
   my $db            = shift ; 
   my $item          = shift ; 
   my $list_control  = shift ; 

   my $as_templates = { 
         'lbls'   => 'list-labels'
      ,  'cloud'  => 'list-cloud' 
      ,  'table'  => 'list-grid' 
   };
   my $template = 'controls/' . $as_templates->{ $as } ; 

   $self->render(
      'template'        => $template 
    , 'as'              => $as
    , 'msg'             => $msg
    , 'item'            => $item
    , 'db' 		         => $db
    , 'list_control'    => $list_control
   ); 
}

1;

__END__
