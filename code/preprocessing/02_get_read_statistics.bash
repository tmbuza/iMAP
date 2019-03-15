#!/usr/bin/env bash

mkdir results/stats
mkdir results/stats/qc0

seqkit stat ./data/raw/*R1*.fastq.gz -o ./results/stats/qc0/R1qcstats.txt
seqkit stat ./data/raw/*R2*.fastq.gz -o ./results/stats//qc0/R2qcstats.txt
