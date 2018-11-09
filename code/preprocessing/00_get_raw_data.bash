#!/usr/bin/env bash

## Author: TMB, April, 2018

## Prepare rawdata folders

mkdir data
mkdir data/raw 

# <br>

## Obtain the raw data and put the files into the data/raw directory
# ```{}

# #Raw data for quick test of iMAP pipeline (8 murine gut samples + 1 Mock sample)  

# unzip MiSeqSOPData.zip 
cp ./data/demo/raw.zip ./
unzip raw.zip
cp raw/* ./data/raw
rm -rf raw* __MACOSX


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

