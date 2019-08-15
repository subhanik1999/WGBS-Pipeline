#!/bin/bash

echo "Splitting of fastq"
SPLIT_NAME=""

PREFIX=$SGE_TASK_ID
# get all the splits for both ends

fastq_splits_R1=($(ls -d $PREFIX/split_output/$PREFIX.R1/*))
fastq_splits_R2=($(ls -d $PREFIX/split_output/$PREFIX.R2/*))

echo ${#fastq_splits_R1[@]}
echo ${#fastq_splits_R2[@]}

# align corresponding splits t reference genome
for ((i=0; i<${#fastq_splits_R1[@]}; i++));
do
  	python bs_seeker2-align.py -1 ${fastq_splits_R1[i]} -2 ${fastq_splits_R2[i]} -g hg38.fa --aligner=bowtie2 -d ./bs_utils/reference_genomes/ -f bam -o samp$PREFIX.$i.bam
done

# merge all mini bam files into overall bam file
samtools merge $PREFIX.out.bam samp$PREFIX.*.bam samp$PREFIX.**.bam

# get methylation report from overall bam file
python bs_seeker2-call_methylation.py -i $PREFIX.out.bam -o $PREFIX.out.meth -d ./bs_utils/reference_genomes/





















