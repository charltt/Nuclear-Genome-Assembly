#!/usr/bin/perl

#this program will order velvet contigs from largest to smallest

#Get File as first arguement on command line
my ($velvet) = $ARGV[0];
chomp $velvet;

#Open file or exit
unless ( open(DNAFILE, $velvet) ) {
    print "Cannot open file \"$velvet\"\n\n";
    exit;
}

my @headers;
my $header;
my @sizes;

#Read in the file and store only header information
while (<DNAFILE>) {
    if ($_ =~ /^>/) {
	push (@headers, $_);
    }
}

#For each header retrieve and store only the contig size
foreach $header (@headers) {
    my @columns = split (/_/, $header);
    my $size = $columns[3];
    push (@sizes, $size);
}

#Sort the contig sizes from large to small
my @sortedsizes = sort { $b <=> $a } @sizes;
my $scalar = scalar (@sortedsizes);

my $i;

#Print output to the screen 
for ($i=0; $i<$scalar; $i++){
    print "$sortedsizes[$i]\n";
}
exit;
