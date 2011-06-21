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

#store Fasta header
my @DNA2;
my $line;
my $fasta;
my @bases;
my $primer;
my $A_Temp;
my $C_Temp;
my $T_Temp;
my $G_Temp;
my $PrimerTM;

foreach $line (@DNA) {
    if ($line =~ /^>/) {
       $fasta = $line;
       chomp $fasta;
       }
   else {
       $primer = $line;
       chomp $primer;
   @bases = split('',$primer);

#Initialize counts 
my $count_A = 0;
my $count_C = 0;
my $count_T = 0;
my $count_G = 0;

#For loop to count bases in turn
foreach $base (@bases) {

    if ($base eq 'A') {
        ++$count_A;
    }elsif ($base eq 'C') {
        ++$count_C;
    }elsif ($base eq 'T') {
        ++$count_T;
    }elsif ($base eq 'G') {
        ++$count_G;
    }else {
        print "Error - I don't recognize this base: $base\n";
        ++$errors;
    }
}

$A_Temp = $count_A * 2;
$C_Temp = $count_C * 4;
$G_Temp = $count_G * 4;
$T_Temp = $count_T * 2;

$PrimerTM = $A_Temp + $C_Temp + $G_Temp + $T_Temp;
       print "$fasta\t$primer\t$PrimerTM\n";
   }
}

    

