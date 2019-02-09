!#/usr/bin/bash

Rscript -e "rmarkdown::render('code/Rmd/report3.Rmd', clean=TRUE, quiet=FALSE, output_file='report3_sequence_processing.html', output_dir='reports')"
# Rscript -e "rmarkdown::render('code/Rmd/report4.Rmd', clean=TRUE, quiet=FALSE, output_file='report4_read_analysis.html', output_dir='reports')"
# Rscript -e "rmarkdown::render('code/Rmd/finalreport.Rmd', clean=TRUE, quiet=FALSE, output_file='iMAP_finalreport.html', output_dir='reports')"
