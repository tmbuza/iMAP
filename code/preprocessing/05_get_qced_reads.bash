#!/usr/bin/env bash

cd ./data/raw/qctrim25
for i in `ls -1 *R1_001.fastq.gz | sed 's/R1_001.fastq.gz//'`
do
./bbmap/bbduk.sh -Xmx4g in1=$i\R1_001.fastq.gz in2=$i\R2_001.fastq.gz out1=./data/raw/qced/$i\R1_001.nophix.fastq.gz out2=./data/raw/qced/$i\R2_001.nophix.fastq.gz outm1=./data/raw/qced/matchedphix/$i\R1_001.matchedphix.fastq.gz outm2=./data/raw/qced/matchedphix/$i\R2_001.matchedphix.fastq.gz ref=./bbmap/resources/phix174_ill.ref.fa.gz k=31 hdist=1 overwrite=True
done
cd ../../../
./FastQC/fastqc ./data/raw/qced/*nophix.fastq.gz -o ./results/fastqc/qced/



