#!/usr/bash

# Author:
# Purpose: 
# Usage: bash 02_get_read_statistics.bash

mkdir results/stats
mkdir results/stats/qc0

./code/seqkit stat ./data/raw/*R1*.fastq.gz -o ./results/stats/qc0/R1qcstats.txt
./code/seqkit stat ./data/raw/*R2*.fastq.gz -o ./results/stats//qc0/R2qcstats.txt
