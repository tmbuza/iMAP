#!/usr/bin/env bash

mkdir results/multiqc \
	results/multiqc/qc0 \
	results/multiqc/qc0/R1 \
	results/multiqc/qc0/R2 \
	results/multiqc/qctrim25 \
	results/multiqc/qctrim25/R1 \
	results/multiqc/qctrim25/R2 \
	results/multiqc/qced \
	results/multiqc/qced/R1 \
	results/multiqc/qced/R2

multiqc ./results/fastqc/qc0 -o ./results/multiqc/qc0
multiqc ./results/fastqc/qc0 --ignore *_R2* -o ./results/multiqc/qc0/R1
multiqc ./results/fastqc/qc0 --ignore *_R1* -o ./results/multiqc/qc0/R2
multiqc ./results/fastqc/qctrim25 -o ./results/multiqc/qctrim25
multiqc ./results/fastqc/qctrim25 --ignore *_R2* -o ./results/multiqc/qctrim25/R1
multiqc ./results/fastqc/qctrim25 --ignore *_R1* -o ./results/multiqc/qctrim25/R2
multiqc ./results/fastqc/qced -o ./results/multiqc/qced
multiqc ./results/fastqc/qced --ignore *_R2* -o ./results/multiqc/qced/R1
multiqc ./results/fastqc/qced --ignore *_R1* -o ./results/multiqc/qced/R2
