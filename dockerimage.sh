#!/usr/bin/env bash

sudo git clone https://github.com/tmbuza/iMAP.git
cp -r iMAP/* .

# Declare variables
imageName=tmbuza/imap:v1.1
containerName=imapv1

sudo docker build -t $imageName -f Dockerfile .

sudo docker run --name=containerName --rm -ti $imageName /bin/bash 
bash code/linux_iMAP_driver.bash
echo "Successfully completed the analysis"
