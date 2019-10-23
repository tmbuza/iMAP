#!/usr/bin/env bash

mkdir results/fastqc \
	results/fastqc/qc0 

fastqc ./data/raw/*fastq.gz -o ./results/fastqc/qc0




