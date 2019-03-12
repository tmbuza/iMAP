#!/usr/bin/env bash

## Author: TMB, April, 2018

## Prepare rawdata folders

mkdir data
mkdir data/metadata 
mkdir data/raw 
mkdir data/raw/qced
# <br>

## Obtain the raw data and put the files into the data/raw directory

# unzip MiSeqSOPData.zip 
cp ./data/demo/raw.zip .
unzip raw.zip
cp raw/* ./data/raw
rm -rf raw* __MACOSX


# Copy demo metadata and put the files in the data/metadata directory
cp ./data/demo/metadata/* ./data/metadata

# Copy mapping fastq file and put it in the data/raw/qced directory
# cp ./data/demo/mapping.files ./data/raw/qced/qced.files

# #Raw data for the iMAP test package (19 murine gut samples + 1 Mock sample)
# wget --no-check-certificate https://www.mothur.org/w/images/d/d6/MiSeqSOPData.zip
# unzip MiSeqSOPData.zip 
# gzip MiSeq_SOP/*.fastq
# cp MiSeq_SOP/*.fastq.gz data/raw
# rm MiSeqSOPData.zip
# rm -rf MiSeq_SOP __MACOSX

# #Raw data for a reproducible manuscript (360 murine gut samples + 2 Mock samples)
# # * Download raw data from https://www.mothur.org/MiSeqDevelopmentData/StabilityWMetaG.tar
# # * Ran the following from the project's root directory

# wget --no-check-certificate https://www.mothur.org/MiSeqDevelopmentData/StabilityWMetaG.tar
# tar xvf StabilityWMetaG.tar -C ./data/raw/
# rm StabilityWMetaG.tar
# # ```

