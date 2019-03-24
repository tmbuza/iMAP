#!/usr/bin/env bash


## Metadata Profiling
# bash ./code/progressreport1.bash

## Install some tools
bash ./code/requirements/iMAP_requirements_linux_driver.bash

## Read Preprocessing
bash ./code/preprocessing/iMAP_preprocessing_driver.bash
bash ./code/summarizeFastQC/iMAP_multiqc_driver.bash

## QC report
# bash ./code/progressreport2.bash
