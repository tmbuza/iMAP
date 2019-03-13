#!/usr/bin/env bash

mkdir results/stats
mkdir results/stats/qc0
mkdir results/stats/qctrim25
mkdir results/stats/qced

seqkit stat /myprojects/data/raw/qctrim25/*R1*.fastq.gz -o /myprojects/results/stats/qctrim25/R1qcstats.txt
seqkit stat /myprojects/data/raw/qctrim25/*R2*.fastq.gz -o /myprojects/results/stats//qctrim25/R2qcstats.txt
seqkit stat /myprojects/data/raw/qced/*R1*.fastq.gz -o /myprojects/results/stats/qced/R1qcstats.txt
seqkit stat /myprojects/data/raw/qced/*R2*.fastq.gz -o /myprojects/results/stats//qced/R2qcstats.txt
