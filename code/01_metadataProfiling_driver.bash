#!/usr/bin/env bash

## Metadata Profiling
bash ./code/progressreport1.bash


if [ "$?" != "0" ]; then
    echo "[Error] Some files are missing,!" 1>&2
    exit 1
fi
