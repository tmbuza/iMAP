#!/usr/bin/bash

Rscript -e "rmarkdown::render('code/Rmd/report3.Rmd', clean=TRUE, quiet=FALSE, output_file='report3_sequence_processing.html', output_dir='reports')"
