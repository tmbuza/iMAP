#!/usr/bin/env bash

## Author: TMB, April, 2018, modified October 2019

## Reference data folders folders

mkdir data \
	data/references 

## SILVA seed alignment (default)

sudo wget --no-check-certificate https://www.mothur.org/w/images/7/71/Silva.seed_v132.tgz 


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, downloading Silva.seed akignments aborted, exiting...!" 1>&2
    exit 1
fi


sudo tar -xvzf Silva.seed_v132.tgz -C data/references/


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, cannot untar the Silva.seed_v132.tgz file, exiting...!" 1>&2
    exit 1
fi


mothur "#get.lineage(fasta=data/references/silva.seed_v132.align, taxonomy=data/references/silva.seed_v132.tax, taxon=Bacteria);degap.seqs(fasta=data/references/silva.seed_v132.pick.align, processors=8)"


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, getting bacteria lineage and degapping aborted, exiting...!" 1>&2
    exit 1
fi

## Optional renaming of the files
mv data/references/silva.seed_v132.pick.align data/references/silva.seed.align
mv data/references/silva.seed_v132.pick.tax  data/references/silva.seed.tax


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, moving files renaming the files failed, exiting...!" 1>&2
    exit 1
fi

rm Silva.seed_v132.tgz*


## Get taxonomy classifiers

##############################################################
# # Taxonomy references
##############################################################

##############################################################
# Silva nr
## Make a taxonomy references fasta file from silva.nr.align. This will output silva.nr.fasta which automatically is placed in the data/references

# mothur/mothur "#degap.seqs(fasta=data/references/silva.nr.align)"
# ```

##############################################################
# Silva seed
## Make a taxonomy references fasta file from silva.seed.align . This will output silva.seed.fasta which automatically is placed in the data/references
# * Clean up the directories to remove the extra files

mothur "#degap.seqs(fasta=./data/references/silva.seed.align)"
# ```

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, degapping silva.seed.align aborted, exiting...!. Do you have executable mothur function?" 1>&2
    exit 1
fi


# ##############################################################
# ### RDP
# # ```{}
# wget --no-check-certificate -N https://www.mothur.org/w/images/c/c3/Trainset16_022016.pds.tgz
# tar xvzf Trainset16_022016.pds.tgz
# mv trainset16_022016.pds/train* data/references/
# rm -rf trainset16_022016.pds
# rm Trainset16_022016.pds.tgz
# # ```

# ##############################################################
# ### Greengenes
# # ```{}
# wget --no-check-certificate http://www.mothur.org/w/images/6/68/Gg_13_8_99.taxonomy.tgz
# tar xvzf Gg_13_8_99.taxonomy.tgz gg_13_8_99.fasta gg_13_8_99.gg.tax
# mv gg* data/references/
# rm Gg_13_8_99.taxonomy.tgz
# # ```

# ##############################################################
# Get HMP_MOCK.fasta - an unaligned fasta sequence file that contains sequences in the mock community

sudo wget --no-check-certificate https://www.mothur.org/MiSeqDevelopmentData/HMP_MOCK.fasta && \
mv HMP_MOCK.fasta data/references


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, downloading HMP_MOCK.fasta aborted, exiting...!" 1>&2
    exit 1
fi


# #```{}
mv mothur.*.logfile LOG
#```