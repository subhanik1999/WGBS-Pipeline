#!/bin/bash

PREFIX=$SGE_TASK_ID

# get total number of reads from fastq file i.e. lines divided by 4
reads=$(cat ./$PREFIX/$PREFIX.R1.fq|wc -l)
reads=$((reads / 4))
echo "fastq reads "
echo $reads >> "reads${PREFIX}.txt"

# get aligned reads in bam file
reads=$(samtools view -c -F 4 $PREFIX.out.bam)
echo "full bam "
echo $reads >> "reads${PREFIX}.txt"
