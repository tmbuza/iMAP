#!/usr/bin/env bash

mkdir results/fastqc
mkdir results/fastqc/qced

fastqc ./data/raw/*fastq.gz -o ./results/fastqc/qced


