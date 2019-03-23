#!/usr/bin/env bash

# Create docker container for metadata profiling
containerName=metadata_profiling 
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash

# Metadata profiling
bash code/imap_metadata_profiling_driver.bash


if [ "$?" != "0" ]; then
    echo "[Error] metadata profiling failed, please review!" 1>&2
    exit 1
fi

