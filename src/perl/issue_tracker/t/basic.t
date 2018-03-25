#!/usr/bin/perl
#
use Mojo::Base -strict;

BEGIN {
  use Cwd qw (abs_path);
  my $my_inc_path = Cwd::abs_path($0);

  $my_inc_path =~ m/^(.*)(\\|\/)(.*?)(\\|\/)(.*)/;
  $my_inc_path = $1;

  print "\$my_inc_path $my_inc_path \n" ;
  sleep 3 ; 

  unless (grep { $_ eq "$my_inc_path" } @INC) {
    push(@INC, "$my_inc_path");
    $ENV{'PERL5LIB'} .= "$my_inc_path";
  }

  unless (grep { $_ eq "$my_inc_path/lib" } @INC) {
    push(@INC, "$my_inc_path/lib");
    $ENV{'PERL5LIB'} .= ":$my_inc_path/lib";
  }
}

use Test::More;
use Test::Mojo;


my $t = Test::Mojo->new('IssueTracker');
$t->get_ok('/')->status_is(200)->content_like(qr/Mojolicious/i);

done_testing();
