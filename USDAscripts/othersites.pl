#!/usr/bin/perl

use strict;
use warnings;

#Usage:  wrongsites.pl <SNP file> <pileup output> > outfile

#This code will estimate the number and percentage of incorrect base calls for non-SNP positions

#Get name of SNP file as first arguement on command line                          
my ($snpfile) = $ARGV[0];
chomp $snpfile;

#Get name of pileup file as second arguement on command line                      
my ($pileup) = $ARGV[1];
chomp $pileup;

#use awk to extract SNP positions from cns.snp                                    
my $awk = "/usr/bin/awk";
my @variablesites = `$awk '{print \$2}' $snpfile`;

#determine how many SNP sites                                                     
my $numofSNPs = scalar @variablesites;
#print "$numofSNPs\n";

my @reads;
unless (open(PILEUP, $pileup) ) {
    print "Cannot open file \$snpfile\"\n\n";
    exit;
}

my $counter=1;
my $varcounter=0;
while (<PILEUP>) {
    if ($varcounter != scalar(@variablesites)) {
        if ($variablesites[$varcounter] == $counter) {
     	     $varcounter++;
	     $counter++;
             next;
	}
    }
    push (@reads, $_);
    $counter++;
}
my $size = scalar(@reads);
print "$size\n";

my $i;
my @DNA;
my $base;
my $count_A;
my $count_C;
my $count_T;
my $count_G;
my $count_N;
my $count_ref;
my $line;

foreach $line (@reads){
    next if ($line =~ /^$/);
#    print "$line";
    my @columns = split(/@/,$line);
    my $bases = $columns[1];
    @DNA = split('',$bases);
    my $size = scalar (@DNA);

#Initialize counts                                                                   
    $count_A = 0;
    $count_C = 0;
    $count_T = 0;
    $count_G = 0;
    $count_N = 0;
    $count_ref = 0;
#For loop to count bases in turn                                                     
    foreach $base (@DNA) {
        if ($base eq 'A' || $base eq 'a') {
            ++$count_A;
        }elsif ($base eq 'C' || $base eq 'c') {
            ++$count_C;
        }elsif ($base eq 'T' || $base eq 't') {
            ++$count_T;
        }elsif ($base eq 'G' || $base eq 'g') {
            ++$count_G;
        }elsif ($base eq 'N' || $base eq 'n') {
            ++$count_N;
        }elsif ($base eq '.') {
            ++$count_ref;
        }elsif ($base eq ',') {
            ++$count_ref;
        }
    }


    my $total = $count_A+$count_C+$count_G+$count_T+$count_N+$count_ref;
    my $snpA = $count_A/$total *100;
    my $roundedA = sprintf("%.2f", $snpA);
    my $snpC = $count_C/$total *100;
    my $roundedC = sprintf("%.2f", $snpC);
    my $snpG = $count_G/$total *100;
    my $roundedG = sprintf("%.2f", $snpG);
    my $snpT = $count_T/$total *100;
    my $roundedT = sprintf("%.2f", $snpT);
    my $snpN = $count_N/$total *100;
    my $roundedN = sprintf("%.2f", $snpN);
    my $snpref = $count_ref/$total *100;
    my $roundedref = sprintf("%.2f", $snpref);
    my $vartotal = $count_A+$count_C+$count_G+$count_T;
    my $varpro= $vartotal/$total*100;
    my $roundedvar = sprintf("%.2f", $varpro);

#print results 
    if ($roundedref < 100){                                                     
	print "$line\n";
	print "A = $count_A - $roundedA%\n";
	print "C = $count_C - $roundedC%\n";
	print "G = $count_G - $roundedG%\n";
	print "T = $count_T - $roundedT%\n";
	print "ref = $count_ref - $roundedref%\n";
	print "N = $count_N - $roundedN%\n";
	print "Total Variation = $vartotal - $roundedvar%\n";
	print "Total = $total\n";

	open OUTFILE, ">>NonSNPvar.txt";
	if ($roundedvar != 0){
	print OUTFILE "$roundedvar\n";
	}
    }
}
exit;



