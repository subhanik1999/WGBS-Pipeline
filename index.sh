#!/bin/bash
# indexes the reference genome: hg38.fa
python bs_seeker2-build.py -f hg38.fa --aligner=bowtie2 -p ../bin
