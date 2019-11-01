#!/usr/bin/env bash

# iMAP Unix/Linux Environment

## Create bin folder in home directory (if it doesn't exist)
cd ~/
mkdir bin

## Get read statistics

### Install seqkit

wget --no-check-certificate https://github.com/shenwei356/seqkit/releases/download/v0.11.0/seqkit_darwin_amd64.tar.gz
tar -zxvf seqkit_darwin_amd64.tar.gz
chmod 755 seqkit

rm -f seqkit_darwin_amd64.tar.gz

# which seqkit # Must show the location of seqkit


## Base call quality

### Install FastQC
wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip
unzip fastqc_*.zip
chmod 755 FastQC/fastqc

rm -f fastqc_*.zip 

# which fastqc # Must show the location of fastqc


## Filter or trim out poor reads

### Install BBDuk via BBmap
wget --no-check-certificate https://sourceforge.net/projects/bbmap/files/BBMap_38.69.tar.gz
tar -xvzf BBMap_38.69.tar.gz
chmod 755 bbmap/bbduk.sh

rm BBMap_38.69.tar.gz

# which bbduk.sh # Must show the location of bbduk.sh 


## Summarize Base Call Phred Scores
# Requires python. Install python usong conda


# pip3 --disable-pip-version-check --no-cache-dir install --user multiqc #Probably installed in /usr/local/bin/multiqc
pip --disable-pip-version-check --no-cache-dir install --user multiqc #Probably installed in /usr/local/bin/multiqc


# which multiqc # Must show the location of multiqc 


## Sequence Processing classification

### Install latest stable version of mothur (Mac)
wget  --no-check-certificate https://github.com/mothur/mothur/releases/download/v.1.43.0/Mothur.OSX-10.14.zip
unzip Mothur.OSX-10.14.zip
chmod 755 mothur/mothur
chmod 755 mothur/vsearch
chmod 755 mothur/uchime

rm -rf Mothur.OSX-10.14.zip 


# Link the executable tools to the home/bin and export the home/bin to the PATH

ln -s ~/seqkit ~/bin/seqkit
ln -s ~/FastQC/fastqc ~/bin/fastqc
ln -s ~/bbmap/bbduk.sh ~/bin/bbduk.sh
ln -s /Users/tmbuza/miniconda3/bin/multiqc ~/bin/multiqc
ln -s ~/mothur/mothur ~/bin/mothur
ln -s ~/mothur/vsearch ~/bin/vsearch
ln -s ~/mothur/uchime ~/bin/uchime



## Make sure all executable tools are in the PATH
echo ""
echo ""
echo "Location of the executable tools"
which seqkit # Must show the location of seqkit
which fastqc # Must show the location of fastqc
which bbduk.sh # Must show the location of bbduk.sh
which multiqc # Must show the location of multiqc
which mothur # Must show the location of fastqc
which vsearch # Must show the location of vsearch
which uchime # Must show the location of uchime

echo ""
echo "Done|"
echo ""


# Add $HOME/bin to the PATH
# echo “export PATH=“$PATH:$HOME/bin" >> ~/.bashrc”
# source  ~/.bashrc

