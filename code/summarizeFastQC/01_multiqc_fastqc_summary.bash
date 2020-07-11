#!/usr/bin/env bash

# Install multiQC then summarize the fastqc results
# This is installed via python environment (latest version 3+)
# Check what version of python is installed on your computer by typping 'python --version'
# For more details see the installation manual http://multiqc.info/docs/#manual-installation

# python --version
# pip3 install --upgrade pip
# pip3 install --user multiqc

# git clone https://github.com/ewels/MultiQC.git
# mv MultiQC ./code
# python3 ./code/MultiQC/setup.py install

mkdir results/multiqc
mkdir results/multiqc/qced
mkdir results/multiqc/qced/R1
mkdir results/multiqc/qced/R2
mkdir results/multiqc/qctrim25
mkdir results/multiqc/qctrim25/R1
mkdir results/multiqc/qctrim25/R2
mkdir results/multiqc/qcphix
mkdir results/multiqc/qcphix/R1
mkdir results/multiqc/qcphix/R2
multiqc  ./results/fastqc/qced -o ./results/multiqc/qced
multiqc  ./results/fastqc/qced --ignore *_R2* -o ./results/multiqc/qced/R1
multiqc  ./results/fastqc/qced --ignore *_R1* -o ./results/multiqc/qced/R2
multiqc  ./results/fastqc/qctrim25 -o ./results/multiqc/qctrim25
multiqc  ./results/fastqc/qctrim25 --ignore *_R2* -o ./results/multiqc/qctrim25/R1
multiqc  ./results/fastqc/qctrim25 --ignore *_R1* -o ./results/multiqc/qctrim25/R2
multiqc ./results/fastqc/qcphix  -o ./results/multiqc/qcphix
multiqc ./results/fastqc/qcphix  --ignore *_R2* -o ./results/multiqc/qcphix/R1
multiqc ./results/fastqc/qcphix  --ignore *_R1* -o ./results/multiqc/qcphix/R2
