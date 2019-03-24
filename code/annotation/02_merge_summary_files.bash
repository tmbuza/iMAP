#!/usr/bin/env bash


mkdir results/tables

# paste -d'\t' ./data/mothur/phylotype/00_processed_seqs/qced.contigs.count.summary ./data/mothur/phylotype/00_processed_seqs/qced.trim.contigs.good.count.summary ./data/mothur/phylotype/00_processed_seqs/qced.trim.contigs.good.good.count.summary  ./data/mothur/phylotype/00_processed_seqs/qced.trim.contigs.good.unique.good.filter.unique.precluster.count.summary ./data/mothur/phylotype/00_processed_seqs/qced.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.count.summary ./data/mothur/phylotype/00_processed_seqs/qced.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.pick.count.summary >./data/mothur/phylotype/00_processed_seqs/seqdepth.tsv

# echo -e "SampleID\tOriginal\tScreened\tAligned\tDenoised\tNonChimeric\tBacteriaOnly\tNoMock" >results/tables/processedSeqs.tsv
# cut -f1,2,4,6,8,10,12,14 ./data/mothur/phylotype/00_processed_seqs/seqdepth.tsv >>results/tables/processedSeqs.tsv

# head results/tables/processedSeqs.tsv



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
