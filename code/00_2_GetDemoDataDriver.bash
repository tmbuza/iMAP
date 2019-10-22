#!/usr/bin/env bash

bash ./code/dataFiles/01_get_demo_data.bash

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, the input data is required. Please add rawdata and metadata files and try agains. !" 1>&2
    exit 1
fi


bash ./code/refdatabase/01_download_refDBs.bash


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, something is wrong with the download. Please fix the problem and try again. !" 1>&2
    exit 1
fi
