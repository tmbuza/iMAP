#!/usr/bin/env bash

# Create docker container for generating final reports
containerName=progress_reports
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash

# Reporting
bash code/imap_report_driver.bash



if [ "$?" != "0" ]; then
    echo "[Error] iMAP report failed, please review!" 1>&2
    exit 1
fi
