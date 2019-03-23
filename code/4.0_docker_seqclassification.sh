# Create a docker container for sequence classification using mothur
containerName=seqclassify
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap tmbuza/mothur:v1.41.3 /bin/bash

# Process and classify the sequences
bash code/imap_classify_driver.bash



if [ "$?" != "0" ]; then
    echo "[Error] sequence classification failed, please review!" 1>&2
    exit 1
fi
