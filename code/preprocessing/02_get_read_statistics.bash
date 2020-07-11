#!/usr/bin/env bash

mkdir results/stats
mkdir results/stats/qced

seqkit stat ./data/raw/*R1*.fastq.gz -o ./results/stats/qced/R1qcstats.txt
seqkit stat ./data/raw/*R2*.fastq.gz -o ./results/stats/qced/R2qcstats.txt
