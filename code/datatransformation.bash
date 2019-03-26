#!/usr/bin/bash

Rscript -e "rmarkdown::render('code/Rmd/phylotype_constaxonomy_transformed.Rmd', clean=TRUE, quiet=FALSE, output_dir='../../results/tables/phylotype')"
