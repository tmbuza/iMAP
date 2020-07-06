#!/usr/bin/env bash

# Purpose: Copy demo data to metadata and raw folders

cp iMAP/resources/metadata/samplemetadata.tsv iMAP/data/metadata/


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, samplemetadata.tsv not found, exiting...,!" 1>&2
    exit 1
fi

cp iMAP/resources/qc*.files iMAP/data/metadata/

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, some mapping files not found, exiting...,!" 1>&2
    exit 1
fi

cp iMAP/resources/manifest.txt iMAP/data/metadata/

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, manifest.txt not found, exiting...,!" 1>&2
    exit 1
fi
    
unzip -oj iMAP/resources/raw.zip -d iMAP/data/raw/

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, rawdata zipped file not found, exiting...,!" 1>&2
    exit 1
fi

cp iMAP/resources/metadata/var1.design iMAP/data/metadata/ 

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, var1.design not found, exiting...,!" 1>&2
    exit 1
fi

cp iMAP/resources/metadata/var2.design iMAP/data/metadata/

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, var2.design not found, exiting...,!" 1>&2
    exit 1
fi



