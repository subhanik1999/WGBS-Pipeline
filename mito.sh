#!/bin/bash
PREFIX=$SGE_TASK_ID

#isolate reads from sorted bam file that align to chrM
samtools view -b $PREFIX.bam_sorted > mtdna$PREFIX.bam 
