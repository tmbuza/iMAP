
#!/usr/bin/env bash

## Author: TMB, April, 2018

## Prepare project folders
```{}
mkdir data
mkdir data/references 
```

## Default reference alignments
 ```{}
wget --no-check-certificate https://www.mothur.org/w/images/7/71/Silva.seed_v132.tgz
tar xvzf Silva.seed_v132.tgz silva.seed_v132.align silva.seed_v132.tax
mothur "#get.lineage(fasta=silva.seed_v132.align, taxonomy=silva.seed_v132.tax, taxon=Bacteria);degap.seqs(fasta=silva.seed_v132.pick.align, processors=8)"
mv silva.seed_v132.pick.align data/references/silva.seed.align
mv silva.seed_v132.pick.tax data/references/silva.seed.tax
rm S*.tgz
rm silv*
```
