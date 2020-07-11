#!/usr/bin/env bash

# Requires bbmap tool. Predownloaded package is in the resources. Unzip it and place the content in the code folder.

# unzip -o iMAP/resources/bbmap.zip -d iMAP/code/

# cd data/raw
# for i in `ls -1 *R1_001.fastq.gz | sed 's/R1_001.fastq.gz//'`
# do
# /imap/code/bbmap/bbduk.sh -Xmx4g in1=$i\R1_001.fastq.gz in2=$i\R2_001.fastq.gz out1=/imap/data/raw/qctrim25/$i\trim25_R1_001.fastq.gz out2=/imap/data/raw/qctrim25/$i\trim25_R2_001.fastq.gz qtrim=r trimq=25 overwrite=True
# done
# cd ../../

# fastqc /imap/data/raw/qctrim25/*trim25*fastq.gz -o ./results/fastqc/qctrim25


cd data/raw
for i in `ls -1 *R1_001.fastq.gz | sed 's/R1_001.fastq.gz//'`
do
/imap/code/bbmap/bbduk.sh -Xmx4g in1=$i\R1_001.fastq.gz in2=$i\R2_001.fastq.gz out1=/imap/data/raw/qctrim25/$i\R1_001.fastq.gz out2=/imap/data/raw/qctrim25/$i\R2_001.fastq.gz qtrim=r trimq=25 overwrite=True
done
cd ../../

mkdir results/fastqc/qctrim25

fastqc /imap/data/raw/qctrim25/*fastq.gz -o ./results/fastqc/qctrim25

cp /imap/data/raw/qced.files /imap/data/raw/qctrim25/qctrim25.files


mkdir results/stats/qctrim25
seqkit stat ./data/raw/qctrim25/*R1*.fastq.gz -o ./results/stats/qctrim25/R1qcstats.txt
seqkit stat ./data/raw/qctrim25/*R2*.fastq.gz -o ./results/stats//qctrim25/R2qcstats.txt