#!/usr/bin/bash

Rscript -e "rmarkdown::render('./phylotype_constaxonomy_transformed.Rmd', clean=TRUE, quiet=FALSE, output_dir='../../results/tables/phylotype')"
