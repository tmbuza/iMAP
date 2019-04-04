#!/usr/bin/env bash

## Install bbmap tools (didn't work in docker image)
# bash ./code/requirements/iMAP_additional_software_driver.bash

## Download reference databases
# bash ./code/refdatabase/iMAP_download_driver.bash

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
