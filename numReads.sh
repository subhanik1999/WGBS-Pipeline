#!/bin/bash

PREFIX=$SGE_TASK_ID

#touch "readsInBam${PREFIX}.txt"
reads=$(cat ./$PREFIX/$PREFIX.R1.fq|wc -l)
reads=$((reads / 4))
echo "fastq reads "
echo $reads >> "reads${PREFIX}.txt"

reads=$(samtools view -c -F 4 $PREFIX.out.bam)
echo "full bam "
echo $reads >> "reads${PREFIX}.txt"
