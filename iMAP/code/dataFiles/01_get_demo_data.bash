#!/usr/bin/env bash


### Load the rawdata in the designated folders 
# * The pipeline comes with demo data for testing purposes.

mkdir data \
    data/metadata \
    data/raw
    
cp ./resources/metadata/samplemetadata.tsv ./data/metadata/


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, samplemetadata.tsv not found, exiting...,!" 1>&2
    exit 1
fi

cp ./resources/qced.files ./data/metadata/

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, qced.files not found, exiting...,!" 1>&2
    exit 1
fi

cp ./resources/manifest.txt ./data/metadata/

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, manifest.txt not found, exiting...,!" 1>&2
    exit 1
fi

# unzip -o ./resources/bbmap.zip -d ./code/
unzip -oj ./resources/raw.zip -d ./data/raw/


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, zipped file not found, exiting...,!" 1>&2
    exit 1
fi

cp ./resources/metadata/var1.design ./data/metadata/ 

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, var1.design not found, exiting...,!" 1>&2
    exit 1
fi

cp ./resources/metadata/var2.design ./data/metadata/

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, var2.design not found, exiting...,!" 1>&2
    exit 1
fi
cp ./resources/metadata/var3.design ./data/metadata/ 

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, var3.design not found, exiting...,!" 1>&2
    exit 1
fi

cp ./resources/metadata/var4.design ./data/metadata/

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, var4.design not found, exiting...,!" 1>&2
    exit 1
fi
