#!/usr/bin/perl

use strict;
use warnings;

#This script will remove the Ns from a maq assembled consensus sequence and create f
asta files of the remaining nucleotide fragments

#Get file as first argument on the command line
    my ($dna_filename) = $ARGV[0];
chomp $dna_filename;

#Open file or exit
unless ( open(DNAFILE, $dna_filename) ) {
    print "Cannot open file \"$dna_filename\"\n\n";
    exit;
}

#Read in file and store in array
my @DNA = <DNAFILE>;
close DNAFILE;

#Remove fasta header
my @DNA2;

foreach my $line (@DNA) {
    if ($line =~ /^>/) {
        next;
    }
    else {
        push (@DNA2, $line);
    }
}

#From the lines of the DNA file, put the DNA sequence into a single string
$DNA2 = join('',@DNA2);

#Remove whitespace
$DNA2 =~ s/\s//g;

#Explode DNA into array where each base is an element in the array
@DNA2 = split('',$DNA2);

#Set flags to distinguish between ns and nucleotides
my $nflag=0;

#Use loop to create outfiles, go through loop and send nucleotides to outfiles while
 skipping ns.

    my $filenum=1;
my $fasta = ">";

open OUTFILE, ">>contig$filenum.txt";
print OUTFILE "$fasta$filenum\n";
foreach $base (@DNA2) {
    if ($base =~ /[ATCGRYKMSWBDHVatcgrykmswbdhv:]/) {
        print OUTFILE "$base";
        $nflag=0;
    }
    elsif ($base =~ /[Nn]/ &&  $nflag == 0) {
        close OUTFILE;
        $filenum++;
        open OUTFILE, ">>contig$filenum.txt";
        print OUTFILE "$fasta$filenum\n"; 
        $nflag=1;
    }
    elsif ($base =~ /[Nn]/ && $nflag == 1) {
        next;
    }
}
