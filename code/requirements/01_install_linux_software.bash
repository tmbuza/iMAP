
# # start from base
# FROM ubuntu:18.04

# USER root
# mkdir /imap
# WORKDIR /imap

apt-get clean && apt-get update

# ------------------------------------------------------------------
# Install dependencies

apt-get -y clean \
    && apt-get -y update \
    && apt-get -y --no-install-recommends install \
    gzip  \
    zlib1g \
    zlib1g-dev \
    zlibc \
    default-jdk \
	apt-utils \
	build-essential \
	g++ \
	gcc-multilib \
	git \
	curl \
	nano \
	libc6-dev \
	libncurses5-dev \
	libtbb2 \
	libtbb-dev \
	wget \
	unzip \
	zip \
	tar \
	ed \
	less \
	locales \
	vim-tiny \
	ca-certificates \
	apt-transport-https \
	openjdk-8-jdk \
	ant \
	ca-certificates-java \
	python \
	python-dev \
	python-pip \
	python-virtualenv \
	mothur \
	vsearch \
	pandoc \
	pandoc-citeproc \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt-get clean 

# MAINTAINER daniel.nicorici@gmail.com

# LABEL Description="This image install software to implement iMAP" Version="1.0"

# ------------------------------------------------------------------

# Configure default locale, see https://github.com/rocker-org/rocker/issues/19
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

LC_ALL en_US.UTF-8
LANG en_US.UTF-8

# ------------------------------------------------------------------
# git clone https://github.com/tmbuza/iMAP.git 
# COPY . .

# chmod -R 755 code/* && chmod -x code/*/*.css && chmod -x code/*/*.md

# #---------------------------------------------------------------------------
# # Install OpenJDK-8
# # ------------------------------------------------------------------

# apt-get update && \
#     apt-get install -y openjdk-8-jdk && \
# 	apt-get install -y ant && \
# 	apt-get clean;

# # Fix certificate issues
# apt-get update && \
# 	apt-get install ca-certificates-java && \
# 	apt-get clean && \
# 	update-ca-certificates -f && \
# 	apt-get clean 


# Setup JAVA_HOME -- useful for docker commandline
JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
export JAVA_HOME

# #---------------------------------------------------------------------------
# # Install python
# #---------------------------------------------------------------------------

# apt-get update && \
# 	apt-get install -y python python-dev python-pip python-virtualenv && \
# 	rm -rf /var/lib/apt/lists/* && \
# 	apt install python-pip && \
# 	apt-get clean 


#---------------------------------------------------------------------------
# Install seqkit
#---------------------------------------------------------------------------

wget --no-check-certificate https://github.com/shenwei356/seqkit/releases/download/v0.8.0/seqkit_linux_amd64.tar.gz && \
	tar -zxvf seqkit_linux_amd64.tar.gz && \
	chmod 755 seqkit && \
	rm -f seqkit_linux_amd64.tar.gz && \
	cp seqkit /usr/local/bin/seqkit


#---------------------------------------------------------------------------
# Install fastqc
#---------------------------------------------------------------------------

wget --no-check-certificate https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip && \
	unzip fastqc_v0.11.7.zip && \
	chmod 755 FastQC/fastqc && \
	cp FastQC/fastqc /usr/local/bin/fastqc && \
	rm fastqc_v0.11.7.zip


#---------------------------------------------------------------------------
# Install bbmap
#---------------------------------------------------------------------------

wget --no-check-certificate https://sourceforge.net/projects/bbmap/files/BBMap_37.90.tar.gz && \
	tar -xvzf BBMap_37.90.tar.gz && \
	chmod 755 bbmap/bbduk.sh && \
	cp bbmap/bbduk.sh /usr/local/bin/ && \
	rm BBMap_37.90.tar.gz

# #---------------------------------------------------------------------------
# # Install mothur
# #---------------------------------------------------------------------------

# ENV DEBIAN_FRONTEND noninteractive

# apt-get update && \
# 	apt-get install -y mothur && \
# 	apt-get clean && \
# 	apt-get purge && \
# 	rm -rf /var/lib/apt/lists/* /tmp/* && \
# 	apt-get clean 

# #---------------------------------------------------------------------------
# # Install vsearch
# #---------------------------------
# apt-get update && \
# 	apt-get install -y vsearch && \
# 	apt-get clean && \
# 	apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/* && \
# 	apt-get clean 


#---------------------------------------------------------------------------
# Install MultiQC
#---------------------------------------------------------------------------

git clone https://github.com/ewels/MultiQC.git && \
	cd MultiQC && \
	python setup.py install


# # ------------------------------------------------------------------
# # Install pandoc, required for rmarkdown reports
# # ------------------------------------------------------------------

# apt-get update && \
# 	apt-get install -y pandoc && \
# 	apt-get clean 

# apt-get update && \
# 	apt-get install -y pandoc-citeproc && \
# 	apt-get clean 

#---------------------------------------------------------------------------
# Install r-base and all required packages
#---------------------------------------------------------------------------

echo "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/" > /etc/apt/sources.list.d/cran.list

# note the proxy for gpg
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

R_BASE_VERSION 3.5.2
DEBIAN_FRONTEND noninteractive

# Now install R and littler, and create a link for littler in /usr/local/bin
# Also set a default CRAN repo, and make sure littler knows about it too
apt-get update \
	&& apt-get install -y --no-install-recommends \
		littler \
        r-cran-littler \
		r-base=${R_BASE_VERSION}* \
		r-base-dev=${R_BASE_VERSION}* \
		r-recommended=${R_BASE_VERSION}* \
        && echo 'options(repos = c(CRAN = "https://cloud.r-project.org/"), download.file.method = "libcurl")' >> /etc/R/Rprofile.site \
        && echo 'source("/etc/R/Rprofile.site")' >> /etc/littler.r \
	&& ln -s /usr/share/doc/littler/examples/install.r /usr/local/bin/install.r \
	&& ln -s /usr/share/doc/littler/examples/install2.r /usr/local/bin/install2.r \
	&& ln -s /usr/share/doc/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
	&& ln -s /usr/share/doc/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
	&& install.r docopt \
	&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
	&& rm -rf /var/lib/apt/lists/* && \
	apt-get clean 



# #---------------------------------------------------------------------------
# # Install required R packages
# #---------------------------------------------------------------------------

# 	Rscript -e "install.packages('knitr')"
# 	Rscript -e "install.packages('rmarkdown')"
# 	Rscript -e "install.packages('ggplot2')"
# 	Rscript -e "install.packages('dplyr')"
# 	Rscript -e "install.packages('tidyverse')"
# 	Rscript -e "install.packages('ggpubr')"
# 	Rscript -e "install.packages('reshape2')"
# 	Rscript -e "install.packages('grid')"
# 	Rscript -e "install.packages('stringr')"
# 	Rscript -e "install.packages('lubridate')"
# 	Rscript -e "install.packages('randomForest')"
# 	Rscript -e "install.packages('readr')"
# 	Rscript -e "install.packages('scales')"
# 	Rscript -e "install.packages('iNEXT')"
# 	Rscript -e "install.packages('funModeling')"
# 	Rscript -e "install.packages('vegan')"
# 	Rscript -e "install.packages('FactoMineR')"
# 	Rscript -e "install.packages('factoextra')"
# 	Rscript -e "install.packages('NbClust')"
# 	Rscript -e "install.packages('cluster')"
# 	Rscript -e "install.packages('ggdendro')"
# 	Rscript -e "install.packages('kableExtra')"
# 	Rscript -e "install.packages('tm')"
# 	Rscript -e "install.packages('SnowballC')"
# 	Rscript -e "install.packages('wordcloud')"
# 	Rscript -e "install.packages('wordcloud2')"
# 	Rscript -e "install.packages('htmlwidgets')"
# 	Rscript -e "install.packages('RColorBrewer')"
# 	Rscript -e "install.packages('servr')"
# 	Rscript -e "install.packages('bookdownplus')"
# 	Rscript -e "install.packages('data.table')"
# 	Rscript -e "install.packages('png')"
# 	Rscript -e "install.packages('corrplot')"
# 	Rscript -e "install.packages('webshot::install_phantomjs()')"
# 	Rscript -e "install.packages('goeveg')"
# 	Rscript -e "install.packages('cowplot')"
# 	Rscript -e "install.packages('caTools')"
# 	Rscript -e "install.packages('bookdown')"
# 	Rscript -e "install.packages('plotrix')"

# CMD ["bash"]

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################

# #!/usr/bin/env bash

# mkdir ~/bin

# ##############################################################
# ## Download seqkit and put it into the code directory
# # ```{}

# # Linux version
# wget --no-check-certificate https://github.com/shenwei356/seqkit/releases/download/v0.8.0/seqkit_linux_amd64.tar.gz
# tar -zxvf seqkit_linux_amd64.tar.gz
# mv seqkit code/
# chmod 755 code/seqkit
# cp code/seqkit ~/bin
# rm seqkit_linux_amd64.tar.gz

# # Mac version
# # wget --no-check-certificate https://github.com/shenwei356/seqkit/releases/download/v0.8.0/seqkit_darwin_amd64.tar.gz
# # tar -zxvf seqkit_darwin_amd64.tar.gz
# # mv seqkit code/
# # rm seqkit_darwin_amd64.tar.gz

# # ```

# # Windows version (Coming soon)


# ##############################################################
# ## Download fastqc and put it into the code directory
# # ```{}

# # Linux version
# wget --no-check-certificate https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
# unzip fastqc_v0.11.7.zip
# chmod 755 FastQC/fastqc
# mv -v FastQC code/
# cp code/FastQC/fastqc ~/bin/
# rm fastqc_v0.11.7.zip
# # ```

# # Mac version (Coming soon)

# # Windows version (Coming soon)

# ##############################################################
# # Install bbmap
# # Note that this can sometimes be difficult to uncompress…..
# # Refer: https://jgi.doe.gov/data-and-tools/bbtools/bb-tools-user-guide/installation-guide/

# wget --no-check-certificate https://sourceforge.net/projects/bbmap/files/BBMap_37.90.tar.gz
# tar -xvzf BBMap_37.90.tar.gz
# mv -v bbmap code/
# cp code/bbmap/bbduk.sh ~/bin/
# rm BBMap_37.90.tar.gz


# ##############################################################
# ## Download latest mothur compartible to your platform and put it into the code directory
# ##!Important: Latest versions may not work well until it is stable. Should that hapen, just install a previous version.
# # #Linux
# wget --no-check-certificate https://github.com/mothur/mothur/releases/download/v1.41.3/Mothur.linux_64.zip
# # wget --no-check-certificate https://github.com/mothur/mothur/releases/download/v1.40.0.1/Mothur.linux_64.zip
# # wget --no-check-certificate https://github.com/mothur/mothur/releases/download/v1.39.5/Mothur.linux_64.zip
# unzip Mothur.linux_64.zip
# mv ./mothur code/
# cp ./code/mothur/mothur ~/bin/
# cp ./code/mothur/uchime ~/bin/
# cp ./code/mothur/vsearch ~/bin/
# rm ./Mothur.linux_64.zip
# rm -rf ./__MACOSX


# # sudo apt install mothur

# # # Install MultiQC

# git clone https://github.com/ewels/MultiQC.git
#   cd MultiQC
#   python setup.py install
  
