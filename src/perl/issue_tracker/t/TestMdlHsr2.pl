use strict ; use warnings ; 

use FindBin;
BEGIN { unshift @INC, "$FindBin::Bin/../lib" }
use Data::Printer ; 

use Test::More tests => 5 ; 
use IssueTracker::App::Utils::Initiator ; 
use IssueTracker::App::Utils::Logger ; 
use IssueTracker::App::Utils::Configurator ; 
use IssueTracker::App::Ctrl::Dispatcher ; 
use IssueTracker::App::Mdl::MdlHsr2 ; 


my $msg = ();
my $objInitiator 				= 'IssueTracker::App::Utils::Initiator'->new();	
my $appConfig					= {} ;

$appConfig                 = $objInitiator->get('AppConfig');

my  $objConfigurator
    = 'IssueTracker::App::Utils::Configurator'->new($objInitiator->{'ConfFile'},
    \$appConfig);

$appConfig                 = $objConfigurator->getConfHolder()  ;

my $objMdlHsr2             = 'IssueTracker::App::Mdl::MdlHsr2'->new ( \$appConfig ) ; 

# 1.
# -----
$msg = 'test that the objMdlHsr2 is created' ; 
ok ( ref($objMdlHsr2) eq 'IssueTracker::App::Mdl::MdlHsr2' , $msg ) ;

# 2.
# -----
$msg = 'check that the appConfig is passed correctly' ; 
my $chkAppConfig  = $objMdlHsr2->get('appConfig' ) ; 
ok ( $chkAppConfig == $appConfig , $msg ) ;

# 3.
# -----
# or how-to check that a perl hash is empty 
# src: https://stackoverflow.com/a/9444948/65706
$msg = 'check that an empty hsr2 is created during initializatin' ; 
my $hsr2  = $objMdlHsr2->get('hsr2' ) ; 

ok ( !%$hsr2 , $msg ) ;

# 4.
# -----
$msg = 'check that an empty mhsr2 is created during initializatin' ; 
my $mhsr2  = $objMdlHsr2->get('mhsr2' ) ; 
ok ( !%$mhsr2 , $msg ) ;


# 5.
# -----
$msg = 'verify that the model can add hash ref of hash refs' ; 
my $hsr2_to_pass           = { 'key1' => 'value' }; 
$objInitiator 				   = 'IssueTracker::App::Utils::Initiator'->new( $hsr2_to_pass ) ; 
my $hsr2_to_chck           = { 'key1' => 'value' }; 
$objMdlHsr2->addHsr2( $hsr2_to_pass ) ; 
my $hsr2_to_out = $objMdlHsr2->get('hsr2' ) ; 

is_deeply( $hsr2_to_out , $hsr2_to_pass , $msg ) ;












