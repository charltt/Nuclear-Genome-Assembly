#!/bin/bash

#path to unprocessed fastq files for each lane
dir1=~/Desktop/Trichinella.dir/T1.dir/T1_RawData/Flowcell4/

i=2



#for each .fastq in the directory, run quality_breakdown.py and store 		results in .qual 
for file in `ls $dir1/s_*`

do
    	~/Nuclear-Genome-Assembly/USDAscripts/quality_breakdown.py $file > s_$i.qual
    	~/Nuclear-Genome-Assembly/USDAscripts/eliminate_n_single.py $file > s_$i.fastq.NoNs
    	~/Nuclear-Genome-Assembly/USDAscripts/quality_breakdown.py s_$i.fastq.NoNs > s_$i.fastq.NoNs.qual

    	let i=$i+1
done
