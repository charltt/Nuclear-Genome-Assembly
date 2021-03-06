USDA Scripts
============

MakeNs.pl - This script will print  X Ns based on user input. 
Output can be redirected to a file using ">"
To run:  MakeNs.pl <# of Ns>

gapsizes.pl - will take a list of coordinates which are positions of 0 read depths and calculate the size of the gaps.  Useage:  gapsizes.pl <filename>

trim5.pl - will trim bases off the 5' end of the short read.  Usage:  trim5.pl <filename> <#bases to be trimmed>

compareSNPs.pl - will compare two text files of SNP positions and output differences

makefasta.pl - will take a single long line text file of a sequence and make it into a fasta file (60bp per line).  Need to manually remove and add header information.

removeNs.pl - will remove teh Ns from a maq assembled consensus sequence

velvetsize.pl - will order the sizes of velvet contigs from largest to smallest

convertunmapped.pl - Will convert the unmapped reads exported from maq map from the output format to fasta format.

runmaq.sh - will read in multiple fastq files and run them through the MAQ program.  Hard coded path to directories and files - need to change as working dataset changes.

2millionreads.pl - reads in a fastq file of > 2million short reads.  Will create smaller subfiles from the original based on the desired size entered by the user.
>2millionreads.pl <fastq.txt> <desired#reads>

DNA_count.pl - reads in a fasta file and prints to the screen the total number of As, Cs, Gs and Ts contained in the file.  
<DNA_count.pl <fastafile.fa>

NextGenFile_count.pl - same as DNA_count.pl but takes a non-fasta unformatted DNA input file (fastq?).  
NextGenFile_count.pl <input file>

PrimerCount.pl - searches through next gen output files (fastq?) and detects Illumina primer sequences present in short reads.  
PrimerCount.pl <input file>

RemoveFasta.pl - removes the fasta header from a fasta file and returns a file of just DNA sequence.
RemoveFasta.pl <fastafile.fa>

SNPcounts.pl - using the MAQ output files out.filtered.snp (or cns.snp) and out.pileup, this script will pull those sites identified as SNPs from the out.pileup file and calculate base frequency stats for each position.
SNPcounts.pl <snp file> <pileup file> > <outfile>

othersites.pl - using the MAQ output files out.filtered.snp (or cns.snp) and out.
pileup, this script will pull those sites NOT identified as SNPs from the out.pil
eup file and calculate base frequency stats for each   position.
othersites.pl <snp file> <pileup file> > <outfile>

primer_Tm.pl - reads in a fasta file of primers and will calculate the Tm.
primer_Tm.pl <primers.fa>

