# iMAP: Integrative Microbiome Analysis Pipeline

## Version: iMAP v1.0

The project directory has code, data, img, reports, and results directories. Within the data directory are demo, metadata, mothur, qiime2, raw, and references directories.

<br>

## Audience
* Microbiologists
* Ecologists
* Bioinformaticians
* Bioinformatics researchers
* Data Scientists
* Any interested user


## Supported Analyses
1. Profiling of Metadata
2. Pre-processing and quality control of paired-reads
3. Sequence processing and classification (default: mothur)
    * Phylotype-based method (works for any dataset size).
    * OTU-based method (works best for small dataset with <100,000 representative sequences).
    * Phylogeny-based method.
    * QIIME2 
4. Transformation of OTU and taxa results. 
5. Diversity and statistical analysis and visualization.
6. Phylogenetic analysis and interactive tree annotation 
6. R-Markdown web-based progress reports


<br>

## Requirements


The first step is to gather all the materials needed for implementing the iMAP pipeline as described in the following table. Most iMAP dependencies are executable and are already placed in the PATH using docker, so users should be able to launch them directly from the command line of the specified container. 

<br>

**Table 1: List of required materials for running iMAP pipeline**

| **Requirement**    | **Description**   |  **Location** | **Remarks**          |
| :--------------------   | :-------------------------------------------------------------   |  :---------------: | :------------:   |
| **Raw data**      | Demultiplexed reads in FASTQ format with primers and barcodes removed        |  data/references   |               |
| **Sample metadata**      | A tab-separated file linking sample identifiers to the variables    |  data/metadata    |   Format: mothur and QIIME2    |
| **Mapping files**      | For linking sample IDs to the data files   |  data/references   |                    |
| <tr><td align="left" colspan="4"><strong>Software</strong> (Most are available via pre-built docker images)</td></tr> |
| *Docker*       | For creating containers that wrap up iMAP dependencies.    |   | [Link](https://docs.docker.com/v17.12/install)  |
| *Seqkit*       | For inspecting rawdata format and simple statistics.    |  docker images: readqctools  | [Link](https://hub.docker.com/r/tmbuza/readqctools)    |  docker images: readqctools | [Link](https://cloud.docker.com/u/tmbuza/repository/list)  |
| *BBduk.sh via BBMap*   | For trimming poor quality reads and removing phiX contamination    |  Auto-loaded at preprocessing step  | [Link](https://sourceforge.net/projects/bbmap/files/)  |
| *MultiQC*      | For summarizing FASTQc output    | docker images: readqctools | [Link](https://hub.docker.com/r/tmbuza/readqctools)  |
| *Mothur*      | For sequence processing, taxonomy assignment and preliminary analysis    |  docker images: mothur:v1.41.3 | [Link](https://cloud.docker.com/repository/docker/tmbuza/mothur ) |
| *QIIME2*      | For sequence processing, taxonomy assignment and preliminary analysis    |  docker images: qiime2:core | [Link]( https://hub.docker.com/r/tmbuza/qiime2) |
| *R*      | For statistical analysis and visualization    | docker image:rpackages:v3.5.2  | [Link](https://cloud.docker.com/repository/docker/tmbuza/rpackages)  |
| *iTOL*      | For displaying, annotating and managing phylogenetic trees   | Onlline |   [Link](http://itol.embl.de/)  | 
| <tr><td align="left" colspan="4"><strong>Reference databases</strong></td></tr> |
| *SILVA* (nr)   | Mothur-formatted rRNA alignments    |   data/references  | [Link](https://www.mothur.org/w/images/3/32/)  |
| *SILVA* (seed)   | Mothur-formatted rRNA alignments    |   data/references  | [Link](https://www.mothur.org/w/images/7/71/)  |
| *SILVA*(de-gapped)     | mothur-formatted classifiers |   data/references   | Auto |
| *SILVA NR*     | QIIME2-formatted classifiers |   data/qiime2   | [Link](https://data.qiime2.org/2018.11/common/silva-132-99-nb-classifier.qza) |
| *RDP*      | Mothur-formatted classifiers |   data/references   | [Link](https://www.Mothur.org/wiki/RDP_reference_files ) |
| *Greengenes*     | Mothur-formatted classifiers |   data/references   | [Link](https://www.Mothur.org/wiki/Greengenes-formatted_databases) |
| *Greengenes*     | QIIME2-formatted classifiers |   data/qiime2   | [Link](https://data.qiime2.org/2018.11/common/gg-13-8-99-nb-classifier.qza) |
| *EzBioCloud*     | Mothur-formatted classifiers |   data/references   | [Link](https://www.ezbiocloud.net/resources)  ||
| *Custom classifiesr*     | Any manually built classifiers. Highly recommended when studying a specific group of known microbes.  | data/references ||


<br>

## Get Started

## Install Docker 
* Link: https://docs.docker.com/install/


The community edition is sufficient

### Download iMAP repository
```{}
git clone https://github.com/tmbuza/iMAP.git


# OR

curl -LOk https://github.com/tmbuza/iMAP/archive/master.zip
unzip master.zip
mv iMAP-master iMAP
rm -rf master.zip


# OR


wget --no-check-certificate https://github.com/tmbuza/iMAP/archive/master.zip 
unzip master.zip
mv iMAP-master iMAP
rm -rf master.zip

```

<br>

### Add data to designated folders
* Rawdata
* Metadata

<br>

### Verify required folders, files and docker images
```{}

bash code/requirements/04_check_folders_and_files.bash

```
<br>

## Get started

### Download and view required Docker images 

```{}

bash code/dockerImages.sh

docker images

```

### Create containers and start analysis

<br>

### Metadata profiling
```{}

containerName=report1
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash

bash code/01_metadataProfiling_driver.bash

exit

```

<br>

### Read Preprocessing
```{}

containerName=readpreprocess
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap tmbuza/readqctools:v1.0.0 /bin/bash

bash code/02_readPreprocess_driver.bash

exit

```
<br>


### Preprocessing progress report
```{}

containerName=report2
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash

bash code/progressreport2.bash

exit

```


### Sequence Processing and Classification with mothur
```{}

containerName=mothurclassification
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap tmbuza/mothur:v1.41.3 /bin/bash

bash code/03_imapClassifyOTU_driver.bash

mkdir LOG && mv *log* LOG/ && rm *.temp

exit

```
<br>


### Sequence processing progress report
```{}

containerName=report3
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash

bash code/progressreport3.bash

exit

```
<br>


### OTU data analysis and visualization 
```{}

containerName=getotu
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap tmbuza/mothur:v1.41.3 /bin/bash

bash code/04_OTUanalysis_driver.bash

mkdir LOG && mv *log* LOG/ && rm *.temp

exit

```

<br>


### Data Transformation
```{}

containerName=datatransformation
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash

bash code/datatransformation.bash

exit

```

<br>


### OTU analysis progress report
```{}

containerName=report4
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash

bash code/progressreport4.bash

exit

```

<br>


### Sequence Processing and Classification with QIIME2
```{}

containerName=qiime2classification
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/qiime2:core /bin/bash

bash code/qiime2/qiime2.bash

exit

```

<br>


### Convert mothur biom file using QIIME2
```{}

containerName=biomconvertmothur
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/qiime2:core /bin/bash

bash code/qiime2/convertmothur_biom.bash

exit

```

<br><hr>

<!-- ```{r label, out.width = "85%", fig.cap = "Figure1"}
knitr::include_graphics("img/Figure1.pdf", auto_pdf = getOption("knitr.graphics.auto_pdf", TRUE), dpi = NULL)
```
 -->
