#!/usr/bin/perl

#This script will compare SNP positions from 2 files containing SNP positions only
#Use awk '{print $2}' out.filtered.snp > snp.positions to generate SNP position list from MAQ out.filtered.snp
#Put the file name of the file that you are searching for unique snps second


#Get file 1 as first arguement on the command line
my ($file1) = $ARGV[0];
chomp $file1;

#Get file 2 as second argument on the command line
my ($file2) = $ARGV[1];
chomp $file2;

#Open both files or exit
unless ( open(FILE1, $file1) ) {
    print "Cannot open file \"$file1\"\n\n";
    exit;
}

unless ( open(FILE2, $file2) ) {
    print "Cannot open file \"$file2\"\n\n";
    exit;
}

#Read in each file and store in an array
my @SNPs1 = <FILE1>;
my @SNPs2 = <FILE2>;

#Determine size of each array
my $size1 = scalar(@SNPs1);
my $size2 = scalar(@SNPs2);

my $i;
my $j;

#Use for loop to check for identical positions, if no match, print position
    for ($i=0; $i<$size2; $i++){
	$j=0;
      foreach my $position (@SNPs1) {
	if ($position == $SNPs2[$i]) {
	    $j=1;
#	    print "$position=$SNPs2[$i] match\n";
#	    last;
	}
      }
	if ($j == 0) {
	    print "no match @ $SNPs2[$i]";
	}
}
	
    

