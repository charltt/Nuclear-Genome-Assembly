#!/usr/bin/perl

#Get File as first arguement on command line
my ($dna_filename) = $ARGV[0];
chomp $dna_filename;

#Open file or exit
    unless ( open(DNAFILE, $dna_filename) ) {
print "Cannot open file \"$dna_filename\"\n\n";
exit;
}

#Initialize counts 
my @BASES;
my $count_A = 0;
my $count_C = 0;
my $count_T = 0;
my $count_G = 0;

#Loop through lines in file
while (<DNAFILE>) {
  $LINE = $_;
  $LINE =~ s/\s//g;
#  print "Line is $LINE";
  @BASES = split(undef,$LINE);
#  print "Base is $BASES[1]\n";
#For loop to count bases in turn
  foreach $base (@BASES) {
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



