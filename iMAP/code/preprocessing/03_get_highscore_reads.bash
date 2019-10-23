#!/usr/bin/env bash

mkdir results/fastqc \
	results/fastqc/qctrim25 \


cd data/raw
for i in `ls -1 *R1_001.fastq.gz | sed 's/R1_001.fastq.gz//'`
do
bbduk.sh -Xmx4g in1=$i\R1_001.fastq.gz in2=$i\R2_001.fastq.gz out1=./qctrim25/$i\R1_001.fastq.gz out2=./qctrim25/$i\R2_001.fastq.gz qtrim=r trimq=25 overwrite=True
done
cd ../../

fastqc ./data/raw/qctrim25/*fastq.gz -o ./results/fastqc/qctrim25

### Simple Statistics for the reads wth Phred score 25 and above (qctrim25)

mkdir results/stats \
		results/stats/qctrim25

touch results/stats/qctrim25/R1qcstats.txt \
	results/stats/qctrim25/R2qcstats.txt \
	
seqkit stat ./data/raw/qctrim25/*R1*.fastq.gz -o ./results/stats/qctrim25/R1qcstats.txt
seqkit stat ./data/raw/qctrim25/*R2*.fastq.gz -o ./results/stats//qctrim25/R2qcstats.txt
