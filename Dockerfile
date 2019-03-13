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
# Install mothur (shared)
#---------------------------------------------------------------------------

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
	apt-get install -y mothur && \
	apt-get clean && \
	apt-get purge && \
	rm -rf /var/lib/apt/lists/* /tmp/*

#---------------------------------------------------------------------------
# Install vsearch (shared)
#---------------------------------
RUN apt-get update && \
	apt-get install -y vsearch && \
	apt-get clean && \
	apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*


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

RUN apt-get update && \
	apt-get install -y pandoc-citeproc

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

CMD ["bash"]
