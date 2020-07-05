#!/usr/bin/env bash

## Author: TMB, April, 2018

## Get taxonomy classifiers

##############################################################
# Silva seed
## Make a taxonomy references fasta file from silva.seed.align . This will output silva.seed.fasta which automatically is placed in the data/references
# * Clean up the directories to remove the extra files

mothur "#degap.seqs(fasta=iMAP/data/references/silva.seed.align)"
# ```
if [ "$?" != "0" ]; then
    echo "[Error] Sorry, something may be wrong with the degap-seq, exiting...!" 1>&2
    exit 1
fi


# ##############################################################
# Get HMP_MOCK.fasta - an unaligned fasta sequence file that contains sequences in the mock community

wget --no-check-certificate https://www.mothur.org/MiSeqDevelopmentData/HMP_MOCK.fasta
mv HMP_MOCK.fasta iMAP/data/references

# #```{}
# rm mothur.*.logfile
#```

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, something may be wrong with the classifiers, exiting...!" 1>&2
    exit 1
fi
