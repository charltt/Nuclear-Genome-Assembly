#!/usr/bin/python
import sys
from Bio import SeqIO

iter = SeqIO.parse(open(sys.argv[1]), "fastq")
try:
	while 1:
		rec1 = iter.next()
		if "N" in rec1: 
			continue

		SeqIO.write([rec1], sys.stdout, "fastq")
except StopIteration, e:
	pass

