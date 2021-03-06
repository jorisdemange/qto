package Qto::Controller::ListGrid ; 
use strict ; use warnings ; 

use Data::Printer ; 
use Scalar::Util qw /looks_like_number/;
use Carp ; 
use List::Util 1.33 'any';

use Qto::App::Utils::Logger;
use Qto::App::IO::In::CnrUrlPrms ; 
use Qto::App::Db::In::RdrDbsFcry;
use Qto::App::Cnvr::CnrHsr2ToArray ; 
use Qto::App::UI::WtrUIFactory ; 

our $config      = {};
our $objModel       = {} ; 

sub doBuildListControl {

	my $self          	= shift ; 
	my $msg           	= shift ; 
   my $objModel      	= ${ shift @_ } ; 
	my $db               = shift ; 
	my $table            = shift ; 

   my $ret           	= 1 ; 
   my $control       	= '' ; 
   my $cols             = () ; 
   my $as               = shift || 'grid' ; 
   my @hides            = () ; 

   ( $ret , $msg , $cols) = $objModel->doGetItemsDefaultPickCols( $config , $db , $table ) ;
   return ( $ret , $msg , '' ) unless $ret == 0 ; 
		
   my $to_picks   = $objModel->get('select.web-action.pick') ; 
   my @picks      = split ( ',' , $to_picks ) if defined ( $to_picks ) ; 
   my $to_hides   = $objModel->get('select.web-action.hide') ; 
   
   @hides      = split ( ',' , $to_hides ) if defined ( $to_hides ) ; 
   push ( @hides , 'level' , 'seq' , 'lft','rgt' ) if $table =~ m/^.*_doc/g ; 

   # the default behaviour is to show all the cols, but those wich must be hidden by default
   unless ( defined ( $to_picks )) {
		foreach my $col ( @$cols ) {
         $control = $control . ",'" . $col . "'" unless ( grep (/^$col$/,@hides )) ; 
      }
      if ( defined ( $control) && length $control > 0  ) {
   	   $control = "['id'," . substr($control, 1) . ']';
      } 
	} 
	else {
      # however if the user explicitly picks cols show ONLY those which are picked, orderly
   	$control = "['id'," ; # it is just the js array definining the cols
   	$control = "[" if $as eq 'print-table' ; 
		foreach my $to_pick ( @picks ) {
         $control .= "'" . $to_pick . "' , " unless ( $to_pick eq 'id' );
		}
		for (1..3) { chop ( $control ) } ;
   	$control .= ']' ;
	}

   $control = "null" unless $control ; # qto-191219140539
   return ( $ret , $msg , $control ) ; 
}

sub new {
   my $invocant 			= shift ;    
   $config           = ${ shift @_ } || croak 'config not set !!!' ;
   $objModel            = ${ shift @_ } || croak 'objModel not set !!!' ; 
   my $class            = ref ( $invocant ) || $invocant ; 
   my $self             = {}; bless( $self, $class );    
   return $self;
}  


1;

__END__

