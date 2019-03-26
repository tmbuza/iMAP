#!/usr/bin/env bash

## Install bbmap tools (didn't work in docker image)
bash ./code/requirements/iMAP_additional_software_driver.bash

## Download reference databases
# bash ./code/refdatabase/iMAP_download_driver.bash

## Read Preprocessing
bash ./code/preprocessing/iMAP_preprocessing_driver.bash
bash ./code/summarizeFastQC/iMAP_multiqc_driver.bash
