#!/usr/bin/env bash

# Create docker container for metadata profiling
containerName=metadata_profiling
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash

# Metadata profiling
bash code/imap_metadata_profiling_driver.bash

# # ########################

# Create docker container for read QC
containerName=preprocess1
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap tmbuza/readqctools:v1.0.0 /bin/bash

# Preprocessing
bash code/imap_preprocess_driver.bash

# # ########################

# Create a docker container for sequence classification using mothur
containerName=seqclassify
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap tmbuza/mothur:v1.41.3 /bin/bash

# Process and classify the sequences
bash code/imap_classify_driver.bash

# ########################

# Create docker container for generating final reports
containerName=progress_reports
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash

# Reporting
bash code/imap_report_driver.bash
