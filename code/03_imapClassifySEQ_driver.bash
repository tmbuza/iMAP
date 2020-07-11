#!/usr/bin/env bash

## Mothur-based Sequence Processing and classification
bash ./code/seqprocessing/iMAP_seqprocessing_driver.bash

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, sequence processing did not finish, exiting...,!" 1>&2
    exit 1
fi

mv mothur.*.logfile LOG

rm *.temp


bash ./code/seqclassification/iMAP_seqclassification_driver.bash


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, sequence classification did not finish, exiting...,!" 1>&2
    exit 1
fi


# bash ./code/seqerrorrate/iMAP_seqerrorrate_driver.bash

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, error estimation did not finish, exiting...,!" 1>&2
#     exit 1
# fi

# mv mothur.*.logfile LOG

rm *.temp

# bash ./code/otutaxonomy/iMAP_otutaxonomy_driver.bash


# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, OTU taxonomy assignment failed, exiting...,!" 1>&2
#     exit 1
# fi

# mv mothur.*.logfile LOG

# bash ./code/annotation/01_processed_seqs.bash # Summarizing processed sequences
# bash ./code/annotation/02_merge_summary_files.bash # Merge summary files to evaluate read length

