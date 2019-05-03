#!/usr/bin/env bash

## Metadata Profiling
bash ./code/progressreport1.bash


if [ "$?" != "0" ]; then
    echo "[Error] Sorry! Failed to create progressreport1. Did you forget to add metadata file?" 1>&2
    exit 1
fi
