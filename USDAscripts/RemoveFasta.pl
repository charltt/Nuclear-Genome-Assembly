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

print "$DNA2";
