!#/usr/bin/bash

Rscript -e "rmarkdown::render('code/Rmd/report4.Rmd', clean=TRUE, quiet=FALSE, output_file='report4_preliminary_analysis.html', output_dir='reports')"
