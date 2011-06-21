#!/usr/bin/perl 
#This script will trim bases from short reads starting at the 5' end 

#Get file as first arguement on the command line
my ($fastq) = $ARGV[0];
chomp $fastq;

#Get number of bases to trim as second argument on command line
my ($trim) = $ARGV[1];
chomp $trim;

#Open fastq file or exit
unless ( open(FASTQ, $fastq) ) {
    print "Cannot open file \"$fastq\"\n\n";
    exit;
}

#Count the number of lines in the file
my $line_count = 0;
while (<FASTQ>) {
    $line_count++;
}
print "lines = $line_count\n";

#Open file to write results to
open OUTFILE, ">>5'trimmed.txt";

#Go through fastq file one line at a time, trimming lines 2 and 4
open(FASTQ, $fastq);
my $j; 
my $read;

for ($j=0; $j<$line_count +1; $j=$j+4) {
    my $line1 = <FASTQ>;
    print OUTFILE "$line1";
    my $line2 = <FASTQ>;
    my @line2 = split('',$line2);
    my $size = scalar(@line2);
    for ($i=0; $i<$size; $i++) {
	if ($i > $trim) {
	    push (@new2, $line2[$i]);
	    	}
    }
    my $new2 = join('',@new2);
    $new2 =~ s/\s//g;
    print OUTFILE "$new2\n";
    reset ('new2');
    my $line3 = <FASTQ>;
    print OUTFILE "$line3";
    my $line4 = <FASTQ>;
    my @line4 = split('',$line4);
    my $size4 = scalar(@line4);
    for ($k=0; $k<$size4; $k++) {
	if ($k > $trim) {
	    push (@new4, $line4[$k]);
	    	}
    }
    my $new4 = join('',@new4);
    $new4 =~ s/\s//g;
    print OUTFILE "$new4\n";
    reset ('new4');
}
	


