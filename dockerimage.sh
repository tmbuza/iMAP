#!/usr/bin/env bash

# Build r-base and packages docker image 
imageName=tmbuza/rpackages:v3.5.2
docker build -t $imageName -f Dockerfile_rpackages .

# Create docker container for generating all reports
containerName=metadata_profiling
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash

# Metadata profiling
bash code/imap_metadata_profiling_driver.bash
# # ########################
# # ########################


# Build imap dependencies docker image
imageName=tmbuza/readqctools:v1.0.0
docker build -t $imageName -f Dockerfile_qctools .

# Create docker container
containerName=preprocess1
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap tmbuza/readqctools:v1.0.0 /bin/bash

# Preprocessing
bash code/imap_preprocess_driver.bash


# # ########################
# # ########################

# Build a mothur docker image
imageName=tmbuza/mothur:v1.41.3
docker build -t $imageName -f Dockerfile_mothur .

# Create a docker container
containerName=seqclassify
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap tmbuza/mothur:v1.41.3 /bin/bash

# Process and classify the sequences
bash code/imap_classify_driver.bash

# ########################
# ########################

# Create docker container for generating all reports
containerName=progress_reports
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash

# Reporting
bash code/imap_report_driver.bash
