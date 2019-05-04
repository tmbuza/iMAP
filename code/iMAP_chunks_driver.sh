#!/usr/bin/env bash

# --------------------
# Chunk1
# --------------------



git clone https://github.com/tmbuza/iMAP.git


# --------------------
# Chunk1
# --------------------

bash iMAP/demo_data.bash


# --------------------
# Chunk1
# --------------------

bash iMAP/code/dockerImages.sh


# --------------------
# Chunk1
# --------------------

containerName=report1
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash
bash code/01_metadataProfiling_driver.bash
exit

# --------------------
# Chunk1
# --------------------

# Metadata profiling

containerName=report1
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash
bash code/01_metadataProfiling_driver.bash
exit


# --------------------
# Chunk1
# --------------------


# Read Preprocessing

containerName=readpreprocess
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap tmbuza/readqctools:v1.0.0 /bin/bash
bash code/02_readPreprocess_driver.bash
exit

# --------------------
# Chunk1
# --------------------


# Preprocessing progress report

containerName=report2
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash
bash code/progressreport2.bash
exit

# --------------------
# Chunk1
# --------------------


# Sequence Processing
# Create a mothur container for sequence processing and classification.
containerName=mothurseqprocessing
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap tmbuza/mothur:v1.41.3 /bin/bash

# --------------------
# Chunk1
# --------------------


# Download reference alignments
# Default: SILVA seed
bash iMAP/code/refdatabase/iMAP_download_driver.bash
# Start sequence processing.
# Assemble the forward and reverse reads, screen by length and create representative sequences
# Align representative sequences with reference alignments. Default SILVA seed.
# Denoising to remove poor alignments
# Removes Chimeric sequences.
# Classify the sequences and post-classification QC.
# Cluster OTU based on Phylotype, OTU-based and Phylogeny methids.
# Assign taxonomy nanes to OTUs.
bash ./code/03_imapClassifyOTU_driver.bash 
Move the logfiles to LOG folder and delete any tmp files.
mv mothur.*.logfile LOG
rm *.temp
exit


# --------------------
# Chunk1
# --------------------


# Sequence processing progress report

containerName=report3
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash
bash code/progressreport3.bash
exit


# --------------------
# Chunk1
# --------------------


# OTU data analysis and visualization
# Preliminary analysis


containerName=getotu
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap tmbuza/mothur:v1.41.3 /bin/bash
bash code/04_OTUanalysis_driver.bash 
mv mothur.*.logfile LOG
rm *.temp
exit

# --------------------
# Chunk1
# --------------------


# Data Transformation

containerName=datatransformation
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash
bash code/datatransformation.bash
exit

# --------------------
# Chunk1
# --------------------


# Statistical analysis
# Statistical analysis compares the variables, and variables are very specific and unique in different studies. Below are links to most important statistical analyses in microbiome studies:

# AMOVA
# HOMOVA
# ANOSIM
# Kruska-Walis
# Lefse
# Metastats
# More...
# OTU analysis progress report

containerName=report4
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash
bash code/progressreport4.bash
exit

# --------------------
# Chunk1
# --------------------


# Sequence Processing and Classification with QIIME2

containerName=qiime2classification
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/qiime2:core /bin/bash
bash code/qiime2/qiime2.bash
exit

# --------------------
# Chunk1
# --------------------


# Convert mothur biom file using QIIME2
# The output is a file containing OTUs and taxonomy


containerName=biomconvertmothur
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/qiime2:core /bin/bash
bash code/qiime2/convertmothur_biom.bash
exit
