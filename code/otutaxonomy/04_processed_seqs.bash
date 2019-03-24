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

