#!/usr/bin/env bash

# iMAP Unix/Linux Environment


## Create bin folder in home directory (if it doesn't exist)
sudo mkdir $HOME/bin


## Install dependencies as necessary.
sudo  apt-get -y clean
sudo apt-get -y update
sudo apt-get -y install \
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
	zlibc 
sudo  rm -rf /var/lib/apt/lists/*
sudo apt-get clean 

## Get read statistics

### Install seqkit

sudo wget --no-check-certificate https://github.com/shenwei356/seqkit/releases/download/v0.8.0/seqkit_linux_amd64.tar.gz
sudo tar -zxvf seqkit_linux_amd64.tar.gz
sudo chmod 755 seqkit
	sudo cp seqkit $HOME/bin/seqkit
	sudo  rm -f seqkit_linux_amd64.tar.gz

# which seqkit # Must show the location of seqkit


## Base call quality

### Install FastQC
sudo wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip
sudo unzip fastqc_*.zip
sudo chmod 755 FastQC/fastqc
    sudo  cp -r FastQC $HOME/bin/FastQC
    sudo  rm -f fastqc_*.zip 

# which fastqc # Must show the location of fastqc


## Filter or trim out poor reads

### Install BBDuk via BBmap
sudo wget --no-check-certificate https://sourceforge.net/projects/bbmap/files/BBMap_38.69.tar.gz
sudo tar -xvzf BBMap_38.69.tar.gz
sudo chmod 755 bbmap/bbduk.sh
    sudo cp bbmap/bbduk.sh $HOME/bin/bbduk.sh
    sudo  rm BBMap_38.69.tar.gz

# which bbduk.sh # Must show the location of bbduk.sh 


## Summarize Base Call Phred Scores
sudo pip3 --disable-pip-version-check --no-cache-dir install multiqc #Probably installed in /usr/local/bin/multiqc
sudo cp /usr/local/bin/multiqc $HOME/bin/multiqc
sudo cp /usr/local/bin/multiqc ./multiqc



## Sequence Processing classification

# ### Install latest stable version of mothur
# sudo wget  --no-check-certificate https://github.com/mothur/mothur/releases/download/v.1.43.0/Mothur.linux_64.zip
# sudo unzip Mothur.linux_64.zip
# sudo chmod 755 mothur/mothur
# sudo chmod 755 mothur/vsearch
# sudo chmod 755 mothur/uchime
#     sudo  mv -v mothur $HOME/
#     sudo cp mothur/mothur $HOME/bin/mothur
#     sudo cp mothur/vsearch $HOME/bin/vsearch
#     sudo cp mothur/uchime $HOME/bin/uchime
# sudo  rm -rf Mothur.linux_64.zip 


## Troubleshooting

##### mothur error while loading shared libraries: libreadline.so.6: cannot open shared object file: No such file or directory
## Try this, it may or may not work.
# cd /lib/x86_64-linux-gnu
# sudo sudo cp libreadline.so.7.0 libreadline.so.6

## Hurray it worked!

## Install noReadline mothur
sudo wget  --no-check-certificate https://github.com/mothur/mothur/releases/download/v.1.43.0/Mothur.linux_noReadline.zip
sudo unzip Mothur.linux_noReadline.zip
sudo chmod 755 mothur/mothur
sudo chmod 755 mothur/vsearch
sudo chmod 755 mothur/uchime

sudo cp ./mothur/mothur $HOME/bin/mothur
sudo cp ./mothur/vsearch $HOME/bin/vsearch
sudo cp ./mothur/uchime $HOME/bin/uchime



sudo  rm -rf Mothur.linux_noReadline.zip

# ## Install noReadline mothur
# sudo wget  --no-check-certificate https://github.com/mothur/mothur/releases/download/v.1.43.0/Mothur.Ubuntu_18.zip
# sudo unzip Mothur.Ubuntu_18.zip
# sudo chmod 755 mothur/mothur
# sudo chmod 755 mothur/vsearch
# sudo chmod 755 mothur/uchime
#     sudo  mv -v mothur $HOME/
#     sudo cp mothur/mothur $HOME/bin/mothur
#     sudo cp mothur/vsearch $HOME/bin/vsearch
#     sudo cp mothur/uchime $HOME/bin/uchime
# 	sudo  rm -rf Mothur.Ubuntu_18.zip 



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



# Added to the $HOME/.bashrc file
# echo "export PATH=$PATH:$HOME::$HOME/bin:$HOME/FastQC:$HOME/bbmap:$HOME/mothur" >> ~/.bashrc
# source  ~/.bashrc

