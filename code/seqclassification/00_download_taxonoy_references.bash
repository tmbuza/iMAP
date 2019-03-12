##############################################################
# # Taxonomy references
##############################################################

##############################################################
# Silva nr
## Make a taxonomy references fasta file from silva.nr.align . This will output silva.nr.fasta which automatically is placed in the data/references
# * Clean up the directories to remove the extra files

mothur "#degap.seqs(fasta=data/references/silva.nr.align)"
# ```

##############################################################
# Silva seed
## Make a taxonomy references fasta file from silva.seed.align . This will output silva.seed.fasta which automatically is placed in the data/references
# * Clean up the directories to remove the extra files

mothur "#degap.seqs(fasta=./data/references/silva.seed.align)"
# ```

##############################################################
### RDP
# ```{}
wget --no-check-certificate -N https://www.mothur.org/w/images/c/c3/Trainset16_022016.pds.tgz
tar xvzf Trainset16_022016.pds.tgz
mv trainset16_022016.pds/train* data/references/
rm -rf trainset16_022016.pds
rm Trainset16_022016.pds.tgz
# ```

##############################################################
### Greengenes
# ```{}
wget --no-check-certificate http://www.mothur.org/w/images/6/68/Gg_13_8_99.taxonomy.tgz
tar xvzf Gg_13_8_99.taxonomy.tgz gg_13_8_99.fasta gg_13_8_99.gg.tax
mv gg* data/references/
rm Gg_13_8_99.taxonomy.tgz
# ```

##############################################################
# # !For V4 datasets only

#```{}
#-------------------------------

# Generate HMP_MOCK.v4.fasta - an unaligned fasta sequence file that contains the V4 region of
# the sequences in the mock community

wget --no-check-certificate https://www.mothur.org/MiSeqDevelopmentData/HMP_MOCK.fasta
mv HMP_MOCK.fasta data/references

# silva nr alignment
mothur "#align.seqs(fasta=data/references/HMP_MOCK.fasta, reference=data/references/silva.nr.v4.align);degap.seqs()"
mv data/references/HMP_MOCK.ng.fasta data/references/HMP_MOCK.nr.v4.fasta

# silva seed alignment
mothur "#align.seqs(fasta=data/references/HMP_MOCK.fasta, reference=data/references/silva.seed.v4.align);degap.seqs()"
mv data/references/HMP_MOCK.ng.fasta data/references/HMP_MOCK.seed.v4.fasta
#```

#```{}
rm mothur.*.logfile
#```
