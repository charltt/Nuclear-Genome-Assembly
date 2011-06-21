#!/usr/bin/perl

#This program will reformat the unmapped reads exported from MAQ into fasta format for Blast
#Output printed to screen.  Use ">" to direct to outfile.


#Get fiel as first arguement on the command line
my ($unmapped) = $ARGV[0];
chomp $unmapped;

#Open file or exit
unless ( open(UNMAPPED, $unmapped) ) {
    print "Cannot open file \"$unmapped\"\n\n";
    exit;
}

my @reads;
#Read the file in and store in an array
while (<UNMAPPED>) {
    push (@reads, $_);
}

my $read;
my @fasta;

#For each read retrieve and store header and sequence
foreach $read (@reads) {
    my @columns = split (" ", $read);
    print ">$columns[0]\n$columns[2]\n";
}

exit;
