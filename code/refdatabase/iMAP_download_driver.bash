#!/usr/bin/env bash

# Mothur classifiers
bash iMAP/code/refdatabase/01_download_refDBs.bash #iMAP 1.0
if [ "$?" != "0" ]; then
    echo "[Error] Sorry, downloading reference databases did not complete. Please fix the problem and try again, exiting...!" 1>&2
    exit 1
fi

# bash iMAP/code/refdatabase/02_download_ref_alignments.bash
# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, reference alignments not found, exiting...!" 1>&2
#     exit 1
# fi

# bash iMAP/code/refdatabase/03_download_taxonomy_classifiers.bash

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, required classifiers not found, exiting...!" 1>&2


# QIIME2 classifiers
bash iMAP/code/qiime2/qiime2-99-515-806-nb-classifier.bash