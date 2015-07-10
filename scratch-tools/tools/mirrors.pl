#!/usr/bin/perl

use strict;
use warnings;

$^I = ".bak";

my $country = "Germany";
my $x = 0;

while( <> ) {
  $x = 1 if /^## $country\n/;
  $x = 0 if /^\n/;
  s/#Server/Server/ if $x eq 1;
  print;
}

