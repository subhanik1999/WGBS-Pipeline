#!/bin/bash

PREFIX=$SGE_TASK_ID

samtools sort -o $PREFIX.out_sorted.bam $PREFIX.out.bam

samtools index $PREFIX.out_sorted.bam
