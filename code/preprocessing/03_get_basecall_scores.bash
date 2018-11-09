#!/usr/bash
# Author:
# Purpose: 
# Usage: 

./code/FastQC/fastqc ./data/raw/*fastq.gz -o ./results/fastqc/qc0

#source activate py3.6.3
#multiqc  ./results/fastqc/qc0 -o ./results/multiqc/qc0
#source deactivate

# # Open the multiqc html files to review
# open ./results/qc0/multiqc/multiqc_report.html
# open ./results/qc0/R1/multiqc/multiqc_report.html
# open ./results/qc0/R2/multiqc/multiqc_report.html

