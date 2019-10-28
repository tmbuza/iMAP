#!/usr/bin/env bash

## Author: TMB, April, 2018, modified October 2019

## Reference data folders folders

mkdir data \
	data/references 

## SILVA seed alignment (default)

sudo wget --no-check-certificate https://www.mothur.org/w/images/7/71/Silva.seed_v132.tgz && \
sudo tar -xvzf Silva.seed_v132.tgz silva.seed_v132.align silva.seed_v132.tax && \
~/bin/mothur "#get.lineage(fasta=silva.seed_v132.align, taxonomy=silva.seed_v132.tax, taxon=Bacteria);degap.seqs(fasta=silva.seed_v132.pick.align, processors=8)" && \
mv silva.seed_v132.pick.align data/references/silva.seed.align && \
mv silva.seed_v132.pick.tax data/references/silva.seed.tax && \
rm Silva.seed_v132.tgz

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, missing required reference alignment, exiting...!" 1>&2
    exit 1
fi


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

# #```{}
mv mothur.*.logfile LOG
#```

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, something may be wrong with the classifiers, exiting...!" 1>&2
    exit 1
fi

