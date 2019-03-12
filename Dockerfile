# start from base
FROM ubuntu:18.04

USER root
RUN mkdir /myprojects
WORKDIR /myprojects

RUN apt-get clean && apt-get update

# ------------------------------------------------------------------
# Install dependencies

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		apt-utils \
		build-essential \
		g++ \
		gcc-multilib \
		git \
		curl \
		nano \
		wget \
		unzip \
		ed \
		less \
		locales \
		vim-tiny \
		ca-certificates \
		apt-transport-https \
		gsfonts \
		gnupg2 \
	&& rm -rf /var/lib/apt/lists/*

# ------------------------------------------------------------------

# Configure default locale, see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

# ------------------------------------------------------------------
# RUN git clone https://github.com/tmbuza/iMAP.git 
COPY . .

RUN chmod -R 755 code/* && chmod -x code/*/*.css && chmod -x code/*/*.md

#---------------------------------------------------------------------------
# Install OpenJDK-8
# ------------------------------------------------------------------

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
	apt-get install -y ant && \
	apt-get clean;

# Fix certificate issues
RUN apt-get update && \
	apt-get install ca-certificates-java && \
	apt-get clean && \
	update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

#---------------------------------------------------------------------------
# Install python
#---------------------------------------------------------------------------

RUN apt-get update && \
	apt-get install -y python python-dev python-pip python-virtualenv && \
	rm -rf /var/lib/apt/lists/* && \
	apt install python-pip


#---------------------------------------------------------------------------
# Install seqkit
#---------------------------------------------------------------------------

RUN wget --no-check-certificate https://github.com/shenwei356/seqkit/releases/download/v0.8.0/seqkit_linux_amd64.tar.gz && \
	tar -zxvf seqkit_linux_amd64.tar.gz && \
	chmod 755 seqkit && \
	rm -f seqkit_linux_amd64.tar.gz && \
	cp seqkit /usr/local/bin/seqkit


#---------------------------------------------------------------------------
# Install fastqc
#---------------------------------------------------------------------------

RUN wget --no-check-certificate https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip && \
	unzip fastqc_v0.11.7.zip && \
	chmod 755 FastQC/fastqc && \
	cp FastQC/fastqc /usr/local/bin/fastqc && \
	rm fastqc_v0.11.7.zip


#---------------------------------------------------------------------------
# Install bbmap
#---------------------------------------------------------------------------

RUN wget --no-check-certificate https://sourceforge.net/projects/bbmap/files/BBMap_37.90.tar.gz && \
	tar -xvzf BBMap_37.90.tar.gz && \
	chmod 755 bbmap/bbduk.sh && \
	cp bbmap/bbduk.sh /usr/local/bin/ && \
	rm BBMap_37.90.tar.gz


#---------------------------------------------------------------------------
# Install mothur
#---------------------------------------------------------------------------

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
apt-get install -y mothur && \
apt-get clean && \
apt-get purge && \
rm -rf /var/lib/apt/lists/* /tmp/* ./*mothur.log*


#---------------------------------------------------------------------------
# Install MultiQC
#---------------------------------------------------------------------------

RUN git clone https://github.com/ewels/MultiQC.git && \
	cd MultiQC && \
	python setup.py install


# ------------------------------------------------------------------
# Install pandoc, required for rmarkdown reports
# ------------------------------------------------------------------

RUN apt-get update && \
	apt-get install -y pandoc


#---------------------------------------------------------------------------
# Install r-base and all required packages
#---------------------------------------------------------------------------

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/" > /etc/apt/sources.list.d/cran.list

# note the proxy for gpg
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

ENV R_BASE_VERSION 3.5.2
ENV DEBIAN_FRONTEND noninteractive

# Now install R and littler, and create a link for littler in /usr/local/bin
# Also set a default CRAN repo, and make sure littler knows about it too
RUN apt-get update \
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
	&& rm -rf /var/lib/apt/lists/*

CMD ["R"]

#---------------------------------------------------------------------------
# Install required R packages
#---------------------------------------------------------------------------

	RUN Rscript -e "install.packages('knitr')"
	RUN Rscript -e "install.packages('rmarkdown')"
	RUN Rscript -e "install.packages('ggplot2')"
	RUN Rscript -e "install.packages('dplyr')"
	RUN Rscript -e "install.packages('tidyverse')"
	RUN Rscript -e "install.packages('ggpubr')"
	RUN Rscript -e "install.packages('reshape2')"
	RUN Rscript -e "install.packages('grid')"
	RUN Rscript -e "install.packages('stringr')"
	RUN Rscript -e "install.packages('lubridate')"
	RUN Rscript -e "install.packages('randomForest')"
	RUN Rscript -e "install.packages('readr')"
	RUN Rscript -e "install.packages('scales')"
	RUN Rscript -e "install.packages('iNEXT')"
	RUN Rscript -e "install.packages('funModeling')"
	RUN Rscript -e "install.packages('vegan')"
	RUN Rscript -e "install.packages('FactoMineR')"
	RUN Rscript -e "install.packages('factoextra')"
	RUN Rscript -e "install.packages('NbClust')"
	RUN Rscript -e "install.packages('cluster')"
	RUN Rscript -e "install.packages('ggdendro')"
	RUN Rscript -e "install.packages('kableExtra')"
	RUN Rscript -e "install.packages('tm')"
	RUN Rscript -e "install.packages('SnowballC')"
	RUN Rscript -e "install.packages('wordcloud')"
	RUN Rscript -e "install.packages('wordcloud2')"
	RUN Rscript -e "install.packages('htmlwidgets')"
	RUN Rscript -e "install.packages('RColorBrewer')"
	RUN Rscript -e "install.packages('servr')"
	RUN Rscript -e "install.packages('bookdownplus')"
	RUN Rscript -e "install.packages('data.table')"
	RUN Rscript -e "install.packages('png')"
	RUN Rscript -e "install.packages('corrplot')"
	RUN Rscript -e "install.packages('webshot::install_phantomjs()')"
	RUN Rscript -e "install.packages('goeveg')"
	RUN Rscript -e "install.packages('cowplot')"
	RUN Rscript -e "install.packages('caTools')"
	RUN Rscript -e "install.packages('bookdown')"
	RUN Rscript -e "install.packages('plotrix')"


#---------------------------------------------------------------------------
# Happily thereafter<3
#---------------------------------------------------------------------------

tmbuza@tmbuza-VirtualBox:~/Desktop/docker/rbase/rockerR/iMAP$ sudo docker run --name=imapapp --rm -ti tmbuza/imapapp:1.0 /bin/bash
[sudo] password for tmbuza: 
root@2bc21321aa79:/myprojects# ls
bbmap  code  data  Dockerfile  FastQC  img  library  LICENSE  MultiQC  posters  README.md  reports  results  seqkit
root@2bc21321aa79:/myprojects# ls /
bin  boot  dev  etc  home  lib  lib32  lib64  libx32  media  mnt  myprojects  opt  proc  root  run  sbin  srv  sys  tmp  usr  var

root@2bc21321aa79:/myprojects# which bbduk.sh fastqc mothur multiqc pip python R Rscript seqkit
/usr/local/bin/bbduk.sh
/usr/local/bin/fastqc
/usr/bin/mothur
/usr/local/bin/multiqc
/usr/bin/pip
/usr/bin/python
/usr/bin/R
/usr/bin/Rscript
/usr/local/bin/seqkit
root@2bc21321aa79:/myprojects# mothur


mothur v.1.39.5
Last updated: 3/20/2017

by
Patrick D. Schloss

Department of Microbiology & Immunology
University of Michigan
http://www.mothur.org

When using, please cite:
Schloss, P.D., et al., Introducing mothur: Open-source, platform-independent, community-supported software for describing and comparing microbial communities. Appl Environ Microbiol, 2009. 75(23):7537-41.

Distributed under the GNU General Public License

Type 'help()' for information on the commands that are available

For questions and analysis support, please visit our forum at https://www.mothur.org/forum

Type 'quit()' to exit program



mothur > 


tmbuza@tmbuza-VirtualBox:~/Desktop/docker/rbase/rockerR/iMAP$ sudo docker push tmbuza/imapapp:1.0
The push refers to repository [docker.io/tmbuza/imapapp]
fc5735aab994: Preparing 
a5d6405a26bd: Preparing 
c5804abe1337: Preparing 
5128b9442ee4: Preparing 
444a1306b5a7: Preparing 
9bbf10f04266: Preparing 
069b32d3dfa5: Preparing 
15506d2b3f0d: Preparing 
57a5433cc6d6: Preparing 
16fad1fb3347: Preparing 
1e5e9cd948d7: Preparing 
6c44854c37f8: Preparing 
e8f842c5e938: Preparing 
354207391c9f: Preparing 
b5007a6d63c5: Preparing 
2921c96d64af: Preparing 
35570d0676cc: Preparing 
b507592bd14e: Preparing 
abbb246492fa: Preparing 
30c3a53882bb: Preparing 
ef2857d96fe3: Preparing 
56ee400dbe14: Preparing 
fc683424cb13: Preparing 
bd59fa60116b: Preparing 
b427b51b1fb7: Preparing 
25ca36664f8e: Preparing 
c58ae3a87409: Preparing 
72ee4698edb1: Preparing 
71719fcf1486: Preparing 
76b17f9a3de2: Preparing 
bd59fa60116b: Pushed 
118cb8a224e0: Pushed 
402c41496d0a: Pushed 
dc025a1903c1: Pushed 
358bacf80934: Pushed 
e22fd432c474: Pushed 
99b8bbb876e6: Pushed 
29bed0370127: Pushed 
82a86b9e2a0e: Pushed 
b3e38082b932: Pushed 
e7f98d8889eb: Pushed 
b6303eb0afa4: Pushed 
4830e27db55a: Pushed 
242918d56950: Pushed 
6f088ac55dc1: Pushed 
40dcd25371e0: Pushed 
c858b32ee7c5: Pushed 
10afd1da8f74: Pushed 
42360e26868f: Pushed 
b49f98bf6d5c: Pushed 
739aac8e0da3: Pushed 
334b5c1a4757: Pushed 
da9a8f2f05d0: Pushed 
7a3760ff3f95: Pushed 
9da50ceeb05c: Pushed 
e7d07e5ff651: Pushed 
9b1b70cb7735: Pushed 
4b7d93055d87: Mounted from tmbuza/install 
663e8522d78b: Mounted from tmbuza/install 
283fb404ea94: Mounted from tmbuza/install 
bebe7ce6215a: Mounted from tmbuza/install 
1.0: digest: sha256:f9d15b7b0a6862d887ed1639f795ac85b9e4264f0602058352df499acb644c51 size: 13152
tmbuza@tmbuza-VirtualBox:~/Desktop/docker/rbase/rockerR/iMAP$ 

Testing

