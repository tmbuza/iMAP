#!/usr/bash

# Author: TMB AUGUST 2018
# Purpose: 
# Usage: bash finsl_read_statistics.bash


mkdir results/stats
# mkdir results/stats/qc0
mkdir results/stats/qctrim25
mkdir results/stats/qced

#./code/seqkit stat ./data/raw/*R1*.fastq.gz -o ./results/stats/qc0/R1qcstats.txt
#./code/seqkit stat ./data/raw/*R2*.fastq.gz -o ./results/stats//qc0/R2qcstats.txt
seqkit stat ./data/raw/qctrim25/*R1*.fastq.gz -o ./results/stats/qctrim25/R1qcstats.txt
seqkit stat ./data/raw/qctrim25/*R2*.fastq.gz -o ./results/stats//qctrim25/R2qcstats.txt
seqkit stat ./data/raw/qced/*R1*.fastq.gz -o ./results/stats/qced/R1qcstats.txt
seqkit stat ./data/raw/qced/*R2*.fastq.gz -o ./results/stats//qced/R2qcstats.txt
