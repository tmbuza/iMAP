#!/usr/bash
# Author:
# Purpose: 
# Usage: 
cd ./data/raw/qctrim25
for i in `ls -1 *R1_001.fastq.gz | sed 's/R1_001.fastq.gz//'`
do
../../../code/bbmap/bbduk.sh -Xmx4g in1=$i\R1_001.fastq.gz in2=$i\R2_001.fastq.gz out1=../qced/$i\R1_001.nophix.fastq.gz out2=../qced/$i\R2_001.nophix.fastq.gz outm1=../qced/matchedphix/$i\R1_001.matchedphix.fastq.gz outm2=../qced/matchedphix/$i\R2_001.matchedphix.fastq.gz ref=../../../code/bbmap/resources/phix174_ill.ref.fa.gz k=31 hdist=1 overwrite=True
done
cd ../../../
./code/FastQC/fastqc ./data/raw/qced/*nophix.fastq.gz -o ./results/fastqc/qced/
#source activate py3.6.3
#multiqc ./results/fastqc/qced  -o ./results/multiqc/qced
# Deactivate python
#source deactivate
# # Open the multiqc html files to review
# open ./results/qced/multiqc_report.html
