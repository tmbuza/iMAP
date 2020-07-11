#!/usr/bin/env bash

# cd ./data/raw/qctrim25
# for i in `ls -1 *R1_001.fastq.gz | sed 's/R1_001.fastq.gz//'`
# do
# /imap/code/bbmap/bbduk.sh -Xmx4g in1=$i\R1_001.fastq.gz in2=$i\R2_001.fastq.gz out1=/imap/data/raw/qcphix/$i\R1_001.nophix.fastq.gz out2=/imap/data/raw/qcphix/$i\R2_001.nophix.fastq.gz outm1=/imap/data/raw/qcphix/matchedphix/$i\R1_001.matchedphix.fastq.gz outm2=/imap/data/raw/qcphix/matchedphix/$i\R2_001.matchedphix.fastq.gz ref=/imap/code/bbmap/resources/phix174_ill.ref.fa.gz k=31 hdist=1 overwrite=True
# done
# cd ../../../
# fastqc /imap/data/raw/qcphix/*nophix.fastq.gz -o ./results/fastqc/qcphix/




cd ./data/raw/qctrim25
for i in `ls -1 *R1_001.fastq.gz | sed 's/R1_001.fastq.gz//'`
do
/imap/code/bbmap/bbduk.sh -Xmx4g in1=$i\R1_001.fastq.gz in2=$i\R2_001.fastq.gz out1=/imap/data/raw/qcphix/$i\R1_001.fastq.gz out2=/imap/data/raw/qcphix/$i\R2_001.fastq.gz outm1=/imap/data/raw/qcphix/matchedphix/$i\R1_001.matchedphix.fastq.gz outm2=/imap/data/raw/qcphix/matchedphix/$i\R2_001.matchedphix.fastq.gz ref=/imap/code/bbmap/resources/phix174_ill.ref.fa.gz k=31 hdist=1 overwrite=True
done
cd ../../../

mkdir results/fastqc/qcphix

fastqc /imap/data/raw/qcphix/*fastq.gz -o ./results/fastqc/qcphix/

cp /imap/data/raw/qced.files /imap/data/raw/qcphix/qcphix.files

mkdir results/stats/qcphix

seqkit stat ./data/raw/qcphix/*R1*.fastq.gz -o ./results/stats/qcphix/R1qcstats.txt
seqkit stat ./data/raw/qcphix/*R2*.fastq.gz -o ./results/stats//qcphix/R2qcstats.txt