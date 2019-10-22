#!/usr/bin/env bash

mkdir 	results/stats \
	results/stats/qc0 

touch results/stats/qc0/R1qcstats.txt \
	results/stats/qc0/R2qcstats.txt 

seqkit stat ./data/raw/*R1*.fastq.gz -o ./results/stats/qc0/R1qcstats.txt
seqkit stat ./data/raw/*R2*.fastq.gz -o ./results/stats/qc0/R2qcstats.txt
