#!/usr/bin/env bash
# bash ./code/refdatabase/01_download_refDBs.bash #iMAP 1.0
bash iMAP/code/refdatabase/02_download_ref_alignments.bash
if [ "$?" != "0" ]; then
    echo "[Error] Sorry, reference alignments not found, exiting...!" 1>&2
    exit 1
fi

bash iMAP/code/refdatabase/03_download_taxonomy_classifiers.bash

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, required classifiers not found, exiting...!" 1>&2
    exit 1
fi
