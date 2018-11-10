#!/usr/bin/env bash

mkdir results/tables

mothur "#set.dir(input=./data/mothur/, output=./data/mothur/phylotype/00_processed_seqs);
count.groups(group=./data/mothur/qced.contigs.groups);
count.groups(count=./data/mothur/qced.trim.contigs.good.count_table);
count.groups(count=./data/mothur/qced.trim.contigs.good.good.count_table);
count.groups(count=./data/mothur/qced.trim.contigs.good.unique.good.filter.unique.precluster.count_table);
count.groups(count=./data/mothur/qced.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.count_table);
count.groups(count=./data/mothur/qced.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.count_table);
count.groups(count=./data/mothur/phylotype/qced.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.pick.count_table)"

paste -d'\t' ./data/mothur/phylotype/00_processed_seqs/qced.contigs.count.summary ./data/mothur/phylotype/00_processed_seqs/qced.trim.contigs.good.count.summary ./data/mothur/phylotype/00_processed_seqs/qced.trim.contigs.good.good.count.summary  ./data/mothur/phylotype/00_processed_seqs/qced.trim.contigs.good.unique.good.filter.unique.precluster.count.summary ./data/mothur/phylotype/00_processed_seqs/qced.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.count.summary ./data/mothur/phylotype/00_processed_seqs/qced.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.pick.count.summary >./data/mothur/phylotype/00_processed_seqs/seqdepth.tsv

echo -e "SampleID\tOriginal\tScreened\tAligned\tPDenoised\tNonChimeric\tBacteriaOnly\tNoMock" >results/tables/processedSeqs.tsv
cut -f1,2,4,6,8,10,12,14 ./data/mothur/phylotype/00_processed_seqs/seqdepth.tsv >>results/tables/processedSeqs.tsv
head results/tables/processedSeqs.tsv
