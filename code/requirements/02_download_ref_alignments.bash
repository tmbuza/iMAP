#!/usr/bin/env bash

## Author: TMB, April, 2018

## Prepare project folders

mkdir data
mkdir data/references 

# <br>

# # Reference alignments.
# * Pull out the bacteria-specific sequences and
# * Clean up the directories to remove the extra files

## SILVA nr alignment
# ```{}
# wget --no-check-certificate https://www.mothur.org/w/images/3/32/Silva.nr_v132.tgz
# tar xvzf Silva.nr_v132.tgz silva.nr_v132.align silva.nr_v132.tax
# code/mothur/mothur "#get.lineage(fasta=silva.nr_v132.align, taxonomy=silva.nr_v132.tax, taxon=Bacteria);degap.seqs(fasta=silva.nr_v132.pick.align, processors=8)"
# mv silva.nr_v132.pick.align data/references/silva.nr.align
# mv silva.nr_v132.pick.tax data/references/silva.nr.tax
# rm S*.tgz
# rm silv*


# # !For V4 datasets only
# Generate a customized version of the SILVA reference database that targets the V4 region
# code/mothur/mothur "#pcr.seqs(fasta=data/references/silva.nr.align, start=11894, end=25319, keepdots=F, processors=8)"
# mv data/references/silva.nr.pcr.align data/references/silva.nr.v4.align

# <br>

## SILVA seed alignment
# ```{}
wget --no-check-certificate https://www.mothur.org/w/images/7/71/Silva.seed_v132.tgz
tar xvzf Silva.seed_v132.tgz silva.seed_v132.align silva.seed_v132.tax
mothur "#get.lineage(fasta=silva.seed_v132.align, taxonomy=silva.seed_v132.tax, taxon=Bacteria);degap.seqs(fasta=silva.seed_v132.pick.align, processors=8)"
mv silva.seed_v132.pick.align data/references/silva.seed.align
mv silva.seed_v132.pick.tax data/references/silva.seed.tax
rm S*.tgz
rm silv*

# # !For V4 datasets only
# Generate a customized version of the SILVA reference database that targets the V4 region
# mothur "#pcr.seqs(fasta=data/references/silva.seed.align, start=11894, end=25319, keepdots=F, processors=8)"
# mv data/references/silva.seed.pcr.align data/references/silva.seed.v4.align

