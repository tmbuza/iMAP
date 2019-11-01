#!/usr/bin/env bash

## Read Preprocessing
bash ./code/preprocessing/iMAP_preprocessing.bash

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, read preprocessing did not finish, please review and try again!" 1>&2
    exit 1
fi
