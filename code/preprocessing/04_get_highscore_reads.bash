#!/usr/bash
# Author:
# Purpose: 
# Usage: 

cd data/raw
for i in `ls -1 *R1_001.fastq.gz | sed 's/R1_001.fastq.gz//'`
do
 ../../code/bbmap/bbduk.sh -Xmx4g in1=$i\R1_001.fastq.gz in2=$i\R2_001.fastq.gz out1=../../data/raw/qctrim25/$i\trim25_R1_001.fastq.gz out2=../../data/raw/qctrim25/$i\trim25_R2_001.fastq.gz qtrim=r trimq=25 overwrite=True
done
cd ../../

./code/FastQC/fastqc ./data/raw/qctrim25/*trim25*fastq.gz -o ./results/fastqc/qctrim25
#source activate py3.6.3
#multiqc  ./results/fastqc/qctrim25 -o ./results/multiqc/qctrim25
# Deactivate python
#source deactivate
# # Open the multiqc html files to review
# open ./results/qctrim25/multiqc_report.html
