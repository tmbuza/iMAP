#!/usr/bin/bash

# Rscript -e "rmarkdown::render('code/Rmd/report2.Rmd', clean=TRUE, quiet=FALSE, output_file='report2_read_preprocessing.html', output_dir='reports')"

Rscript -e "rmarkdown::render('./code/Rmd/report2.Rmd', clean=TRUE, quiet=FALSE, output_file='report2_read_preprocessing.html', output_dir='./reports')"