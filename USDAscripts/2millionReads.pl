#!/usr/bin/perl

use strict;
use warnings;

#Get File as first arguement on command line
my ($fastq_filename) = $ARGV[0];
chomp $fastq_filename;

#Open file or exit
unless ( open(FASTQFILE, $fastq_filename) ) {
    print "Cannot open file \"$fastq_filename\"\n\n";
    exit;}

#Cound the number of lines in the file
my $line_count = 0;
while (<FASTQFILE>) {
	$line_count++;
}
print "There are $line_count lines in the fastq file.\n";

#Every 4 lines = 1 short read, so divide by 4 to determine how many reads
my $shorts = $line_count / 4;
print "there are $shorts short reads in the fastq file.\n";

#Get desired number of reads per file as second arguement on command line
my ($desired) = $ARGV[1];
chomp $desired;

#Print statement to confirm # of reads to user
print "You want files of $desired reads each.\n";

#Divide the number of short reads by the desired number of reads per file
my $final_reads = $shorts / $desired;

#Use this command to round the final_reads to the next whole number
use POSIX qw(ceil);
my $rounded =  ceil($final_reads);
print "This will result in $rounded new files.\n";

open(FASTQFILE, $fastq_filename);

my $count2 = 0;
my $filenumber = 1;
my $j;
my $read;


for ($j=0; $j<$line_count +1; $j=$j+4) {
    $count2++;
my $line1 = <FASTQFILE>;
my $line2 = <FASTQFILE>;
my $line3 = <FASTQFILE>;
my $line4 = <FASTQFILE>;
    if ($count2 == 41506380) {
	print "$line1\n";
	print "$line2\n";
	print "$line3\n";
	print "$line4\n";
    }
$read = $line1.$line2.$line3.$line4;
    open OUTFILE, ">>outfile$filenumber.txt";
    print OUTFILE "$read";
    if ($desired == $count2){
	$filenumber++;
	$count2 = 0;
    }
}


