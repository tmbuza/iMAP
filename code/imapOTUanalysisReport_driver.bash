#!/usr/bin/env bash

## Data transformation
bash ../../code/datatransformation.bash

if [ "$?" != "0" ]; then
    echo "[Error] data transformation failed, please review!" 1>&2
    exit 1
fi


## Preliminary analysis
bash ../../code/progressreport4.bash

if [ "$?" != "0" ]; then
    echo "[Error] preliminary analysis failed, please review!" 1>&2
    exit 1
fi
