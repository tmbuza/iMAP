!#/usr/bin/bash

Rscript -e "rmarkdown::render('Rmd/report1.Rmd', clean=TRUE, quiet=FALSE, output_file='report1_read_preprocessing.html', output_dir='reports')"