#!/usr/bin/bash

# Rscript -e "rmarkdown::render('code/Rmd/report1.Rmd', clean=TRUE, quiet=FALSE, output_file='report1_metadataprofiling.html', output_dir='reports')"
Rscript -e "rmarkdown::render('/myprojects/code/Rmd/report1.Rmd', clean=TRUE, quiet=FALSE, output_file='report1_metadata_profiling.html', output_dir='/myprojects/reports')"


