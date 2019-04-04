#!/usr/bin/env bash

## Mothur-based Sequence Processing and classification
bash ./code/refdatabase/iMAP_download_driver.bash


bash ./code/seqprocessing/iMAP_seqprocessing_driver.bash


bash ./code/seqclassification/iMAP_seqclassification_driver.bash


bash ./code/seqerrorrate/iMAP_seqerrorrate_driver.bash


bash ./code/otutaxonomy/iMAP_otutaxonomy_driver.bash


# bash ./code/annotation/01_processed_seqs.bash # Summarizing processed sequences
# bash ./code/annotation/02_merge_summary_files.bash # Merge summary files to evaluate read length

