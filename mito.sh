#!/bin/bash
PREFIX=$SGE_TASK_ID

samtools view -b $PREFIX.bam_sorted > mtdna$PREFIX.bam 
