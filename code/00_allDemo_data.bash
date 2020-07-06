#!/usr/bin/env bash

# Purpose: Copy demo data to metadata and raw folders

cp iMAP/resources/metadata/samplemetadata.tsv iMAP/data/metadata/


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, samplemetadata.tsv not found, exiting...,!" 1>&2
    exit 1
fi

cp iMAP/resources/qced.files iMAP/data/metadata/

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, qced.files not found, exiting...,!" 1>&2
    exit 1
fi

cp iMAP/resources/manifest.txt iMAP/data/metadata/

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, manifest.txt not found, exiting...,!" 1>&2
    exit 1
fi

# unzip -o iMAP/resources/bbmap.zip -d iMAP/code/
unzip -oj iMAP/resources/raw.zip -d iMAP/data/raw/


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, bbmap zipped file not found, exiting...,!" 1>&2
    exit 1
fi

cp iMAP/resources/metadata/var1.design iMAP/data/metadata/ 

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, var1.design not found, exiting...,!" 1>&2
    exit 1
fi

cp iMAP/resources/metadata/var2.design iMAP/data/metadata/

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, var2.design not found, exiting...,!" 1>&2
    exit 1
fi


# ## Install bbmap tools (didn't work in docker image)
# bash iMAP/code/requirements/iMAP_additional_software_driver.bash

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, the bbmap tool is required, please make sure that it is installed properly. !" 1>&2
#     exit 1
# fi

# ## Download reference databases
# bash iMAP/code/refdatabase/iMAP_download_driver.bash

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, missing one or more required reference database, exiting...!" 1>&2
#     exit 1
# fi



