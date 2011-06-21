#!/usr/bin/perl

use strict;
use warnings;

#Get File1 as first arguement on command line
my ($file1) = $ARGV[0];
chomp $file1;

#Open file or exit
unless ( open(FILE1, $file1) ) {
    print "Cannot open file \"$file1\"\n\n";
    exit;
}


#Get File2 as second argument on command line
my ($file2) = $ARGV[1];
chomp $file2;

#Open file or exit                                                                       
unless ( open(FILE2, $file2) ) {
    print "Cannot open file \"$file2\"\n\n";
    exit;
}

#Read in file 1 and store in array
my @SNPs1 = <FILE1>;
close FILE1;

print "$SNPs1[0], $SNPs1[1], $SNPs1[2]\n";
