#!/usr/bin/perl

use strict;
use warnings;

#This script will print  X Ns based on user input. 
#Output can be redirected to a file using ">"
#To run:  MakeNs.pl <# of Ns>

#Get desired number of Ns as arguement from the command line
my ($Ns) = $ARGV[0];
chomp $Ns;

my $i;

for ($i=0; $i<$Ns; $i++) {
    print "N";
}

