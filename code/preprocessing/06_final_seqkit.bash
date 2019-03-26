#!/usr/bin/env bash

mkdir results/stats/qctrim25
mkdir results/stats/qced

seqkit stat ./data/raw/qctrim25/*R1*.fastq.gz -o ./results/stats/qctrim25/R1qcstats.txt
seqkit stat ./data/raw/qctrim25/*R2*.fastq.gz -o ./results/stats//qctrim25/R2qcstats.txt
seqkit stat ./data/raw/qced/*R1*.fastq.gz -o ./results/stats/qced/R1qcstats.txt
seqkit stat ./data/raw/qced/*R2*.fastq.gz -o ./results/stats//qced/R2qcstats.txt
