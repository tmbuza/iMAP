#!/usr/bin/bash

Rscript -e "rmarkdown::render('/myprojects/code/Rmd/phylotype_constaxonomy_transformed.Rmd', clean=TRUE, quiet=FALSE, output_dir='/myprojects/results/tables/phylotype')"
