!#/usr/bin/bash

Rscript -e "rmarkdown::render('code/Rmd/report1.Rmd', clean=TRUE, quiet=FALSE, output_file='report1_metadataprofiling.html', output_dir='reports')"
