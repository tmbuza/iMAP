#!/usr/bin/env bash

# Install multiQC then summarize the fastqc results
# This is installed via python environment (latest version 3+)
# Check what version of python is installed on your computer by typping 'python --version'
# For more details see the installation manual http://multiqc.info/docs/#manual-installation

pip install --upgrade pip
pip install --user multiqc

#git clone https://github.com/ewels/MultiQC.git
#mv MultiQC ./code
#python3 ./code/MultiQC/setup.py install

mkdir results/multiqc
mkdir results/multiqc/qc0
mkdir results/multiqc/qc0/R1
mkdir results/multiqc/qc0/R2
mkdir results/multiqc/qctrim25
mkdir results/multiqc/qctrim25/R1
mkdir results/multiqc/qctrim25/R2
mkdir results/multiqc/qced
mkdir results/multiqc/qced/R1
mkdir results/multiqc/qced/R2
multiqc  ./results/fastqc/qc0 -o ./results/multiqc/qc0
multiqc  ./results/fastqc/qc0 --ignore *_R2* -o ./results/multiqc/qc0/R1
multiqc  ./results/fastqc/qc0 --ignore *_R1* -o ./results/multiqc/qc0/R2
multiqc  ./results/fastqc/qctrim25 -o ./results/multiqc/qctrim25
multiqc  ./results/fastqc/qctrim25 --ignore *_R2* -o ./results/multiqc/qctrim25/R1
multiqc  ./results/fastqc/qctrim25 --ignore *_R1* -o ./results/multiqc/qctrim25/R2
multiqc ./results/fastqc/qced  -o ./results/multiqc/qced
multiqc ./results/fastqc/qced  --ignore *_R2* -o ./results/multiqc/qced/R1
multiqc ./results/fastqc/qced  --ignore *_R1* -o ./results/multiqc/qced/R2
