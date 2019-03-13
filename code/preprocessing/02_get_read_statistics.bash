#!/usr/bin/env bash

mkdir results/stats
mkdir results/stats/qc0

seqkit stat /myprojects/data/raw/*R1*.fastq.gz -o /myprojects/results/stats/qc0/R1qcstats.txt
seqkit stat /myprojects/data/raw/*R2*.fastq.gz -o /myprojects//results/stats//qc0/R2qcstats.txt
