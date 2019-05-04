#!/usr/bin/env bash

# Purpose: Copy demo data to metadata and raw folders

cp iMAP/resources/metadata/samplemetadata.tsv iMAP/data/metadata/
cp iMAP/resources/qced.files iMAP/data/metadata/
cp iMAP/resources/manifest.txt iMAP/data/metadata/
unzip -o iMAP/resources/bbmap.zip -d iMAP/code/
unzip -oj iMAP/resources/raw.zip -d iMAP/data/raw/
cp iMAP/resources/metadata/var1.design iMAP/data/metadata/ 
cp iMAP/resources/metadata/var2.design iMAP/data/metadata/
