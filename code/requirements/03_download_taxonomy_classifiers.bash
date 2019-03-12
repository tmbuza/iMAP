#!/usr/bin/env bash

## Author: TMB, April, 2018

## Get taxonomy classifiers

##############################################################
# # Taxonomy references
##############################################################

##############################################################
# Silva nr
## Make a taxonomy references fasta file from silva.nr.align. This will output silva.nr.fasta which automatically is placed in the data/references

# mothur "#degap.seqs(fasta=data/references/silva.nr.align)"
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

wget --no-check-certificate https://www.mothur.org/MiSeqDevelopmentData/HMP_MOCK.fasta
mv HMP_MOCK.fasta data/references

# #```{}
rm mothur.*.logfile
#```
