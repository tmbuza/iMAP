!#/usr/bin/bash

# Rscript -e "rmarkdown::render('code/Rmd/report3.Rmd', clean=TRUE, quiet=FALSE, output_file='report3_sequence_processing.html', output_dir='reports')"
Rscript -e "rmarkdown::render('code/Rmd/phylotype_constaxonomy_transformed.Rmd', clean=TRUE, quiet=FALSE, output_dir='results/tables/phylotype')"
# Rscript -e "rmarkdown::render('code/Rmd/finalreport.Rmd', clean=TRUE, quiet=FALSE, output_file='iMAP_finalreport.html', output_dir='reports')"
