#!/usr/bin/bash

# ## Prepare project folders

mkdir data results
mkdir data reports

## Profile and generate progress report and save it in file named metadata_profiling.html
Rscript -e "rmarkdown::render('./code/Rmd/report1.Rmd', clean=TRUE, quiet=FALSE, output_file='report1_metadata_profiling.html', output_dir='./reports')"

