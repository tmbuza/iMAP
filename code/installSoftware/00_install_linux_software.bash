#!/usr/bin/env bash

# iMAP Unix/Linux Environment

## Install dependencies as necessary.
apt-get -y clean && \
apt-get -y update && \
apt-get -y install \
	ant \
	apt-transport-https \
	apt-utils \
	build-essential \
	ca-certificates \
	ca-certificates-java \
	curl \
	default-jdk \
	ed \
	g++ \
	gcc-multilib \
	git \
	less \
	libc6-dev \
	libncurses5-dev \
	libtbb-dev \
	libtbb2 \
	locales \
	nano \
	openjdk-8-jdk \
	openssl \
	python3 \
	python3-pip \
	tar \
	unzip \
	vim-tiny \
	wget \
	zip \
	zlib1g-dev \
	zlibc  && \
rm -rf /var/lib/apt/lists/* && \
apt-get clean 

## Create bin folder in home directory (if it doesn't exist)
mkdir ~/bin

## Set Environment Variables on Linux
export PATH=$PATH:$HOME/bin

## Get read statistics

### Install seqkit

sudo wget --no-check-certificate https://github.com/shenwei356/seqkit/releases/download/v0.8.0/seqkit_linux_amd64.tar.gz && \
sudo tar -zxvf seqkit_linux_amd64.tar.gz && \
sudo chmod 755 seqkit && \
	mv seqkit ~/bin/seqkit && \
	rm -f seqkit_linux_amd64.tar.gz

# which seqkit # Must show the location of seqkit


## Base call quality

### Install FastQC
sudo wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip && \
sudo unzip fastqc_*.zip && \
sudo chmod 755 FastQC/fastqc && \
    mv -v FastQC $HOME/ && \
    ln -s $HOME/FastQC/fastqc $HOME/bin/fastqc && \
    rm -f fastqc_*.zip 

# which fastqc # Must show the location of fastqc


## Filter or trim out poor reads

### Install BBDuk via BBmap
sudo wget --no-check-certificate https://sourceforge.net/projects/bbmap/files/BBMap_38.69.tar.gz && \
sudo tar -xvzf BBMap_38.69.tar.gz && \
sudo chmod 755 bbmap/bbduk.sh && \
    mv -v bbmap $HOME/ && \
    ln -s $HOME/bbmap/bbduk.sh $HOME/bin/bbduk.sh && \
    rm BBMap_38.69.tar.gz

# which bbduk.sh # Must show the location of bbduk.sh 


## Summarize Base Call Phred Scores
sudo pip3 --disable-pip-version-check --no-cache-dir install multiqc #Probably installed in /usr/local/bin/multiqc
ln -s /usr/local/bin/multiqc $HOME/bin/multiqc


## Sequence Processing classification

# ### Install latest stable version of mothur
# sudo wget  --no-check-certificate https://github.com/mothur/mothur/releases/download/v.1.43.0/Mothur.linux_64.zip && \
# sudo unzip Mothur.linux_64.zip && \
# sudo chmod 755 mothur/mothur && \
# sudo chmod 755 mothur/vsearch && \
# sudo chmod 755 mothur/uchime && \
#     mv -v mothur $HOME/ && \
#     ln -s $HOME/mothur/mothur $HOME/bin/mothur && \
#     ln -s $HOME/mothur/vsearch $HOME/bin/vsearch && \
#     ln -s $HOME/mothur/uchime $HOME/bin/uchime && \
# rm -rf Mothur.linux_64.zip 


## Troubleshooting

##### mothur error while loading shared libraries: libreadline.so.6: cannot open shared object file: No such file or directory
## Try this, it may or may not work.
# cd /lib/x86_64-linux-gnu
# sudo ln -s libreadline.so.7.0 libreadline.so.6

## Hurray it worked!

# ## Install noReadline mothur
# sudo wget  --no-check-certificate https://github.com/mothur/mothur/releases/download/v.1.43.0/Mothur.linux_noReadline.zip && \
# sudo unzip Mothur.linux_noReadline.zip && \
# sudo chmod 755 mothur/mothur && \
# sudo chmod 755 mothur/vsearch && \
# sudo chmod 755 mothur/uchime && \
#     mv -v mothur $HOME/ && \
#     ln -s $HOME/mothur/mothur $HOME/bin/mothur && \
#     ln -s $HOME/mothur/vsearch $HOME/bin/vsearch && \
#     ln -s $HOME/mothur/uchime $HOME/bin/uchime && \
# 	rm -rf Mothur.linux_noReadline.zip

## Install noReadline mothur
sudo wget  --no-check-certificate https://github.com/mothur/mothur/releases/download/v.1.43.0/Mothur.Ubuntu_18.zip && \
sudo unzip Mothur.Ubuntu_18.zip && \
sudo chmod 755 mothur/mothur && \
sudo chmod 755 mothur/vsearch && \
sudo chmod 755 mothur/uchime && \
    mv -v mothur $HOME/ && \
    ln -s $HOME/mothur/mothur $HOME/bin/mothur && \
    ln -s $HOME/mothur/vsearch $HOME/bin/vsearch && \
    ln -s $HOME/mothur/uchime $HOME/bin/uchime && \
	rm -rf Mothur.Ubuntu_18.zip 



## Make sure all executable tools are working
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

