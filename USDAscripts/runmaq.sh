#!/bin/sh

#path to directory containing 2million read files
dir1=.

i=0

#for each outfile in the directory, convert to bfq and map to reference sequence
for file in `ls $dir1/outfile*`

do
    /Volumes/MacintoshHD1/Applications/Assembler_Programs/maq-0.7.1/maq fastq2bfq $file reads$i.bfq
    /Volumes/MacintoshHD1/Applications/Assembler_Programs/maq-0.7.1/maq map -u unmapped$i.txt reads$i.map /Volumes/MacintoshHD2/NextGen/Genomes.dir/Trichinella.dir/Nuc.dir/Trich.genome.bfa  reads$i.bfq 
    let i=$i+1
done

mapmerge=""
for file in `ls reads*.map`
do
    mapmerge="$mapmerge $file"
done
echo $mapmerge
/Volumes/MacintoshHD1/Applications/Assembler_Programs/maq-0.7.1/maq mapmerge out.map $mapmerge

/Volumes/MacintoshHD1/Applications/Assembler_Programs/maq-0.7.1/maq mapcheck /Volumes/MacintoshHD2/NextGen/Genomes.dir/Trichinella.dir/Nuc.dir/Trich.genome.bfa  out.map > mapcheck.txt

/Volumes/MacintoshHD1/Applications/Assembler_Programs/maq-0.7.1/maq assemble concsensus.cns /Volumes/MacintoshHD2/NextGen/Genomes.dir/Trichinella.dir/Nuc.dir/Trich.genome.bfa  out.map 2>assemble.log

/Volumes/MacintoshHD1/Applications/Assembler_Programs/maq-0.7.1/maq cns2fq  concsensus.cns > cns.fq

/Volumes/MacintoshHD1/Applications/Assembler_Programs/maq-0.7.1/maq cns2snp  concsensus.cns > cns.snp

maq.pl SNPfilter cns.snp > out.filtered.snp

/Volumes/MacintoshHD1/Applications/Assembler_Programs/maq-0.7.1/maq  pileup /Volumes/MacintoshHD2/NextGen/Genomes.dir/Trichinella.dir/Nuc.dir/Trich.genome.bfa  out.map > out.pileup

/Volumes/MacintoshHD1/Applications/Assembler_Programs/maq-0.7.1/maq mapview out.map > out.aln.txt

maqindex -l 1024 -c concsensus.cns -i out.map

#maqview -c concsensus.cns out.map

rm reads*.bfq