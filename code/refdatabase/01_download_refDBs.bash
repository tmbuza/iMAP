#!/usr/bin/env bash

## Author: TMB, April, 2018, modified October 2019

## Reference data folders folders

mkdir iMAP/data \
    iMAP/data/references 

## sILVA seed alignment (default)

wget --no-check-certificate https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v138.tgz

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, downloading silva.seed alignments aborted, exiting...!" 1>&2
    exit 1
fi


tar -xvzf silva.seed_v138.tgz -C iMAP/data/references/


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, cannot untar the silva.seed_v138.tgz file, exiting...!" 1>&2
    exit 1
fi

# # Bacteria subset
# mothur "#get.lineage(fasta=iMAP/data/references/silva.seed_v138.align, taxonomy=iMAP/data/references/silva.seed_v138.tax, taxon=Bacteria)"

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, getting bacteria lineagedid not finish, exiting...!" 1>&2
#     exit 1
# fi

## Optional renaming of the files
mv iMAP/data/references/silva.seed_*.tax iMAP/data/references/silva.seed.tax
# mv iMAP/data/references/silva.seed_*.tax.accnos iMAP/data/references/silva.seed.accnos
mv iMAP/data/references/silva.seed_*.align iMAP/data/references/silva.seed.align

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, renaming the files failed, exiting...!" 1>&2
    exit 1
fi

## Get taxonomy classifiers
mothur "#degap.seqs(fasta=iMAP/data/references/silva.seed.align, processors=4)"


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, degapping for sila classifier (fasta) did not finish, exiting...!" 1>&2
    exit 1
fi




# ##############################################################

# Get HMP_MOCK.fasta - an unaligned fasta sequence file that contains sequences in the mock community

wget --no-check-certificate https://www.mothur.org/MiSeqDevelopmentData/HMP_MOCK.fasta && \
mv HMP_MOCK.fasta iMAP/data/references


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, downloading HMP_MOCK.fasta aborted, exiting...!" 1>&2
    exit 1
fi


# #```{}
mv mothur.*.logfile iMAP/LOG
#```

rm silva.seed_v138.tgz*

echo " Downloading reference databases completed successfully!" 1>&2

