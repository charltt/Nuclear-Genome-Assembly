#!/usr/bin/perl

#Get File as first arguement on command line
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

#Remove Fasta header
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

#Initialize counts 
my $count_A = 0;
my $count_C = 0;
my $count_T = 0;
my $count_G = 0;

#For loop to count bases in turn
foreach $base (@DNA2) {

    if ($base eq 'A') {
	++$count_A;
    }elsif ($base eq 'C') {
	++$count_C;
    }elsif ($base eq 'T') {
        ++$count_T;
    }elsif ($base eq 'G') {
        ++$count_G;
    }else {
#	print "Error - I don't recognize this base: $base\n";
	++$errors;
    }
}

#print results
print "A = $count_A\n";
print "C = $count_C\n";
print "G = $count_G\n";
print "T = $count_T\n";
print "errors = $errors\n";

#Add all nucleotides
$total = $count_A + $count_C + $count_G + $count_T;
print "Total = $total\n";

#exit
exit;



