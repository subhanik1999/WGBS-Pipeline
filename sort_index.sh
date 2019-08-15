#!/bin/bash

PREFIX=$SGE_TASK_ID

# sorts the bam file
samtools sort -o $PREFIX.out_sorted.bam $PREFIX.out.bam

# indexes the bam file
samtools index $PREFIX.out_sorted.bam
