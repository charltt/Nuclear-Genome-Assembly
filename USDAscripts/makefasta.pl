#!/usr/bin/perl                                                                             
#This file will create a fasta file from a single line text file of sequence
#MUST REMOVE HEADER INFORMATION BEFORE LOADING FILE

#Get file as first argument on the command line                                  
my ($dna_filename) = $ARGV[0];
chomp $dna_filename;

#Open file or exit                                                                          
unless ( open(DNAFILE, $dna_filename) ){
    print "Cannot open file \"$dna_filename\"\n\n";
    exit;
}

#Read in file adn store in array                                                            
my @DNA= <DNAFILE>;
#close DNAFILE; 

#join all lines of file into a single line and remove whitespace
my $DNA2 = join('',@DNA);
$DNA2 =~ s/\s//g;

#split the array such that each base is an element of the array
my @DNA3 = split('',$DNA2);

#determine the size (# of bases) of the array
my $size = scalar (@DNA3);

my $i;
my $j=0;
my @DNA4;
my $end = "\n";

#for each base, push the base into a new array until you have added 60bps, then insert a new line
for ($i=0; $i<$size; $i++) {
    push (@DNA4, $DNA3[$i]);
    $j++;
    if ($j == 60) {
	push (@DNA4, $end);
	$j=0;
    }
}

#print the array to the screen, or use ">" to print to file
print @DNA4;
exit;
