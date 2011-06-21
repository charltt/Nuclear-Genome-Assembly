#!/usr/bin/perl

use strict;
use warnings;

#gapsizes.pl - will takea list of coordinates which arepositions of 0 read depths and calculate the size of the gaps.Useage: gapsizes.pl <filename>


#Get File as first arguement on command line
my ($pos_filename) = $ARGV[0];
chomp $pos_filename;

#Open file or exit
unless ( open(FILE, $pos_filename) ) {
    print "Cannot open file \"$0pos_filename\"\n\n";
    exit;}

#Cound the number of lines in the file
my $line_count = 0;
while (<FILE>) {
    $line_count++;
}
#print "There are $line_count lines in the file.\n";

#Open file or exit                                                                 
unless ( open(FILE, $pos_filename) ) {
    print "Cannot open file \"$0pos_filename\"\n\n";
    exit;}

#Read in each line and store in an array
my @lines = <FILE>;

#Determine size of array, which equals lines in file
my $size = scalar(@lines);

my $i=0;
my $j=1;
my $k=0;
my $l;
for ($l=0; $l<$size; $l++) {

#get first value of array
my $line0 = $lines[$i];

#get second value of array
my $line1 = $lines[$j];

#get first value of gap
my $first_gap = $lines[$k];

#if the difference equal one, move to next elements in the array
if ($line1 - $line0 == 1) {
    $i++;
    $j++;
}

#if difference does not equal one, calcualte size of gap
my $gap;
if ($line1 - $line0 != 1) {
    $gap = 1 + $line0 - $first_gap;
    chomp $first_gap;
    chomp $line0;
    print "$first_gap - $line0  = $gap\n";
#    print "$gap\n";
    $k = $j;
    $i++;
    $j++;
}
}


