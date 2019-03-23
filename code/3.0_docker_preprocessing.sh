# # ########################

# Create docker container for read QC
containerName=preprocess1
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap tmbuza/readqctools:v1.0.0 /bin/bash

# Preprocessing
bash code/imap_preprocess_driver.bash


if [ "$?" != "0" ]; then
    echo "[Error] read preprocessing failed, please review!" 1>&2
    exit 1
fi

