#!/usr/bin/env bash

mkdir results/tables

paste -d'\t' \
./data/mothur/qced.trim.contigs.summary \
./data/mothur/qced.trim.contigs.good.unique.summary \
./data/mothur/qced.trim.contigs.good.unique.good.filter.unique.summary \
./data/mothur/qced.trim.contigs.good.unique.good.filter.unique.precluster.summary \
./data/mothur/qced.trim.contigs.good.unique.good.filter.unique.precluster.pick.summary \
./data/mothur/qced.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.summary \
./data/mothur/phylotype/qced.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.summary \
>./data/mothur/phylotype/00_processed_seqs/seqsummary.tsv

echo -e "Original\tScreened\tAligned\tDenoised\tNonChimeric\tBacteriaOnly\tNoMock" >results/tables/seqsummary.tsv
cut -f4,11,18,25,32,39,46 ./data/mothur/phylotype/00_processed_seqs/seqsummary.tsv >>results/tables/seqsummary.tsv

head results/tables/seqsummary.tsv
