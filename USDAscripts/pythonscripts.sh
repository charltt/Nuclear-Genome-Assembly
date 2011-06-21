#!/bin/sh

#path to unprocessed fastq files for each lane
dir1=/Research/Listeria.dir/N53.dir/RawData.dir/


i=1

#for each .fastq in the directory, run quality_breakdown.py and store results in .qual 
for file in `ls $dir1/s_*`

do
    /usr/local/bin/USDA/quality_breakdown.py $file > s_$i.qual
    /usr/local/bin/USDA/eliminate_n_single.py $file > s_$i.fastq.NoNs
    /usr/local/bin/USDA/quality_breakdown.py s_$i.fastq.NoNs > s_$i.fastq.NoNs.qual
    let i=$i+1
done
