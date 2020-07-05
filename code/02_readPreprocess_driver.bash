#!/usr/bin/env bash
## Read Preprocessing
bash ./code/preprocessing/iMAP_preprocessing_driver.bash


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, read processing did not finish, please review,!" 1>&2
    exit 1
fi


bash ./code/summarizeFastQC/iMAP_multiqc_driver.bash

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, MultiQC failed, please review and fix the problem,!" 1>&2
    exit 1
fi
