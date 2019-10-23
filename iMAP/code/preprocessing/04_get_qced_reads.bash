#!/usr/bin/env bash

mkdir results/fastqc \
	results/fastqc/qced \

cd ./data/raw/qctrim25
for i in `ls -1 *R1_001.fastq.gz | sed 's/R1_001.fastq.gz//'`
do
bbduk.sh -Xmx4g in1=$i\R1_001.fastq.gz in2=$i\R2_001.fastq.gz out1=../qced/$i\R1_001.fastq.gz out2=../qced/$i\R2_001.fastq.gz outm1=../qced/matchedphix/$i\R1_001.matchedphix.fastq.gz outm2=../qced/matchedphix/$i\R2_001.matchedphix.fastq.gz ref=$HOME/bbmap/resources/phix174_ill.ref.fa.gz k=31 hdist=1 overwrite=True
done
cd ../../../
fastqc ./data/raw/qced/*fastq.gz -o ./results/fastqc/qced/

mkdir results/stats \
		results/stats/qced \

touch results/stats/qced/R1qcstats.txt \
	results/stats/qced/R2qcstats.txt

seqkit stat ./data/raw/qced/*R1*.fastq.gz -o ./results/stats/qced/R1qcstats.txt
seqkit stat ./data/raw/qced/*R2*.fastq.gz -o ./results/stats//qced/R2qcstats.txt
