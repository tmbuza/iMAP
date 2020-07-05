#!/usr/bin/env bash

## Author: TMB, April, 2018

## Prepare project folders

mkdir data
mkdir data/references 

# <br>

# # Reference alignments.
# * Pull out the bacteria-specific sequences and
# * Clean up the directories to remove the extra files

## SILVA seed alignment
# ```{}
wget --no-check-certificate https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v138.tgz
tar xvzf silva.seed_v138.tgz silva.seed_v138.align silva.seed_v138.tax
mothur "#get.lineage(fasta=silva.seed_v138.align, taxonomy=silva.seed_v138.tax, taxon=Bacteria);degap.seqs(fasta=silva.seed_v138.pick.align, processors=8)"
mv silva.seed_v138.pick.align iMAP/data/references/silva.seed.align
mv silva.seed_v138.pick.tax iMAP/data/references/silva.seed.tax
rm *ilva*

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, missing required reference alignment, exiting...!" 1>&2
    exit 1
fi


# # !For V4 datasets only
# Generate a customized version of the SILVA reference database that targets the V4 region
# mothur "#pcr.seqs(fasta=data/references/silva.seed.align, start=11894, end=25319, keepdots=F, processors=8)"
# mv data/references/silva.seed.pcr.align data/references/silva.seed.v4.align

