#!/usr/bin/env bash

mkdir results/stats/qcphix

seqkit stat ./data/raw/qcphix/*R1*.fastq.gz -o ./results/stats/qcphix/R1qcstats.txt
seqkit stat ./data/raw/qcphix/*R2*.fastq.gz -o ./results/stats//qcphix/R2qcstats.txt
