#!/usr/bin/env bash

# Raw data and metadata
bash iMAP/code/datafiles/01_get_demo_data.bash

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, downloading raw data and metadata failed. Please check the files and try again, exiting...,!" 1>&2
    exit 1
fi


# Reference database
bash iMAP/code/refdatabase/iMAP_download_driver.bash

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, downloading reference databases failed. Please check the files and try again,exiting...,!" 1>&2
    exit 1
fi


# QC tools
bash iMAP/code/requirements/01_install_bbmap_software.bash


# # Purpose: Copy demo data to metadata and raw folders

# cp iMAP/resources/metadata/samplemetadata.tsv iMAP/data/metadata/


# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, samplemetadata.tsv not found, exiting...,!" 1>&2
#     exit 1
# fi

# cp iMAP/resources/metadata/qc*.files iMAP/data/metadata/

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, some mapping files not found, exiting...,!" 1>&2
#     exit 1
# fi

# cp iMAP/resources/metadata/manifest.txt iMAP/data/metadata/

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, manifest.txt not found, exiting...,!" 1>&2
#     exit 1
# fi
    
# unzip -oj iMAP/resources/raw.zip -d iMAP/data/raw/

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, rawdata zipped file not found, exiting...,!" 1>&2
#     exit 1
# fi

# cp iMAP/resources/metadata/var1.design iMAP/data/metadata/ 

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, var1.design not found, exiting...,!" 1>&2
#     exit 1
# fi

# cp iMAP/resources/metadata/var2.design iMAP/data/metadata/

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, var2.design not found, exiting...,!" 1>&2
#     exit 1
# fi

# unzip -o iMAP/resources/bbmap.zip -d iMAP/code/

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, the bbmap tool is required, please make sure that it is installed properly. !" 1>&2
#     exit 1
# fi

