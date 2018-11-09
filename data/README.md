# Data: Raw and Primary data

## Prepare data folders
```{}
mkdir data
mkdir data/raw
mkdir data/references 
mkdir data/metadata
mkdir data/process
```

## Raw data 
* Download raw data and place it into the data/raw directory
* Users may have their own data, just place it in the data/raw directory


### Included in iMAP test package
```{}
8 murine gut samples + 1 Mock community sample
```

### From mothur MiSEQ SOP
* 19 murine gut samples + 1 Mock community sample
```{}
wget --no-check-certificate https://www.mothur.org/w/images/d/d6/MiSeqSOPData.zip
unzip MiSeqSOPData.zip
gzip MiSeq_SOP/*.fastq
cp MiSeq_SOP/*.fastq.gz data/raw
rm MiSeqSOPData.zip
rm -rf MiSeq_SOP __MACOSX
```

### From murine stability study
* 360 murine gut samples + 2 Mock samples
* Download raw data from https://www.mothur.org/MiSeqDevelopmentData/StabilityWMetaG.tar
```{}
wget --no-check-certificate https://www.mothur.org/MiSeqDevelopmentData/StabilityWMetaG.tar
tar xvf StabilityWMetaG.tar -C ./data/raw/
rm StabilityWMetaG.tar
```

<br>

## Reference alignments.
* Pull out the bacteria-specific sequences and clean up the directories to remove unused files

### SILVA nr alignment
```{}
wget --no-check-certificate https://www.mothur.org/w/images/3/32/Silva.nr_v132.tgz
tar xvzf Silva.nr_v132.tgz silva.nr_v132.align silva.nr_v132.tax
code/mothur/mothur "#get.lineage(fasta=silva.nr_v132.align, taxonomy=silva.nr_v132.tax, taxon=Bacteria);degap.seqs(fasta=silva.nr_v132.pick.align, processors=8)"
mv silva.nr_v132.pick.align data/references/silva.nr.align
mv silva.nr_v132.pick.tax data/references/silva.nr.tax
rm S*.tgz
rm silv*
```

#### !For V4 datasets only
* Generate a customized version of the SILVA reference database that targets the V4 region
```{}
code/mothur/mothur "#pcr.seqs(fasta=data/references/silva.nr.align, start=11894, end=25319, keepdots=F, processors=8)"
mv data/references/silva.nr.pcr.align data/references/silva.nr.v4.align
```

<br>

### SILVA seed alignment
```{}
wget --no-check-certificate https://www.mothur.org/w/images/7/71/Silva.seed_v132.tgz
tar xvzf Silva.seed_v132.tgz silva.seed_v132.align silva.seed_v132.tax
code/mothur/mothur "#get.lineage(fasta=silva.seed_v132.align, taxonomy=silva.seed_v132.tax, taxon=Bacteria);degap.seqs(fasta=silva.seed_v132.pick.align, processors=8)"
mv silva.seed_v132.pick.align data/references/silva.seed.align
mv silva.seed_v132.pick.tax data/references/silva.seed.tax
rm S*.tgz
rm silv*
```

#### !For V4 datasets only
* Generate a customized version of the SILVA reference database that targets the V4 region
```{}
code/mothur/mothur "#pcr.seqs(fasta=data/references/silva.seed.align, start=11894, end=25319, keepdots=F, processors=8)"
mv data/references/silva.seed.pcr.align data/references/silva.seed.v4.align
```

<br>

## Taxonomy references
### Silva nr
* Make a taxonomy references fasta file from silva.nr.align . This will output silva.nr.fasta which automatically is placed in the data/references
* Clean up the directories to remove the extra files
```{}
./code/mothur/mothur "#degap.seqs(fasta=data/references/silva.nr.align)"
```

### Silva seed
* Make a taxonomy references fasta file from silva.seed.align . This will output silva.seed.fasta which automatically is placed in the data/references
* Clean up the directories to remove the extra files

```{}
./code/mothur/mothur "#degap.seqs(fasta=./data/references/silva.seed.align)"
```


### RDP 
```{}
wget --no-check-certificate -N https://www.mothur.org/w/images/c/c3/Trainset16_022016.pds.tgz
tar xvzf Trainset16_022016.pds.tgz
mv trainset16_022016.pds/train* data/references/
rm -rf trainset16_022016.pds
rm Trainset16_022016.pds.tgz
```

### Greengenes
```{}
wget --no-check-certificate http://www.mothur.org/w/images/6/68/Gg_13_8_99.taxonomy.tgz
tar xvzf Gg_13_8_99.taxonomy.tgz gg_13_8_99.fasta gg_13_8_99.gg.tax
mv gg* data/references/
rm Gg_13_8_99.taxonomy.tgz
```

### Mock community
#### For V4 datasets only
```{}
wget --no-check-certificate https://www.mothur.org/MiSeqDevelopmentData/HMP_MOCK.fasta
mv HMP_MOCK.fasta data/references

### From silva nr alignment
code/mothur/mothur "#align.seqs(fasta=data/references/HMP_MOCK.fasta, reference=data/references/silva.nr.v4.align);degap.seqs()"
mv data/references/HMP_MOCK.ng.fasta data/references/HMP_MOCK.nr.v4.fasta

### From silva seed alignment
code/mothur/mothur "#align.seqs(fasta=data/references/HMP_MOCK.fasta, reference=data/references/silva.seed.v4.align);degap.seqs()"
mv data/references/HMP_MOCK.ng.fasta data/references/HMP_MOCK.seed.v4.fasta
```

#### Non-region specific
* Generate HMP_MOCK.fasta - an unaligned fasta sequence file that contains the all 16S rRNA regions of
the sequences in the mock community
```{}
wget --no-check-certificate https://www.mothur.org/MiSeqDevelopmentData/HMP_MOCK.fasta
mv HMP_MOCK.fasta data/references

# silva nr alignment
code/mothur/mothur "#align.seqs(fasta=data/references/HMP_MOCK.fasta, reference=data/references/silva.nr.align);degap.seqs()"
mv data/references/HMP_MOCK.ng.fasta data/references/HMP_MOCK.nr.fasta

# silva seed alignment
code/mothur/mothur "#align.seqs(fasta=data/references/HMP_MOCK.fasta, reference=data/references/silva.seed.align);degap.seqs()"
mv data/references/HMP_MOCK.ng.fasta data/references/HMP_MOCK.seed.fasta
```

### Clean up the directories to remove unused files
```{}
rm mothur.*.logfile
```

