!/usr/bin/env bash

# # bash ./code/metadataprofiling/iMAP_metadata_profiling_driver.bash
# # bash ./code/requirements/iMAP_requirements_linux_driver.bash
# bash ./code/requirements/iMAP_checkFiles_driver.bash

# ## Metadata Profiling
# bash ./code/progressreport1.bash

# ## Read Preprocessing
# bash ./code/preprocessing/iMAP_preprocessing_driver.bash
# bash ./code/summarizeFastQC/iMAP_multiqc_driver.bash
# bash ./code/progressreport2.bash 

# # ## Sequence Processing
# # # bash ./code/mockcommunity/iMAP_mockcommunity_driver.bash
# # # bash ./code/seqprocessing/iMAP_seqprocessing_driver.bash
# # # bash ./code/seqclassification/iMAP_seqclassification_driver.bash
# # bash ./code/seqerrorrate/iMAP_seqerrorrate_driver.bash
# # bash ./code/otutaxonomy/iMAP_otutaxonomy_driver.bash
# # bash ./code/annotation/01_processed_seqs.bash # Summarizing processed sequences
# # bash ./code/annotation/02_merge_summary_files.bash # Merge summary files to evaluate read length
# # bash ./code/progressreport3.bash 

## Data Analysis - Rstudio
bash ./code/datatransformation.bash # Revised on 02/09/2019
bash ./code/dataanalysis/iMAP_dataanalysis_driver.bash # Optional mothur-based preliminary analysis
bash ./code/progressreport4.bash
