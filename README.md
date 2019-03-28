# iMAP: Integrative Microbiome Analysis Pipeline

## Version: iMAP v1.0

The project directory has code, data, img, reports, and results directories. Within the data directory are demo, metadata, mothur, qiime2, raw, and references directories. Most iMAP dependencies are executable are in PATH so you should be able to launch them directly from the corresponding docker container shell prompt once created. 

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
    * OTU-based method (works best of small datatset with <100,000 representative sequences).
    * Phylogeny-based method.
    * QIIME2 
4. Transformation of OTU and taxa results. 
5. Diversity and statistical analysis and visualization.
6. Phylogenetic analysis and interactive tree annotation 
6. R-Markdown web-based progress reports 


<br>

## Requirements


The first step is to gather all materials needed for implementing the iMAP pipeline as describe in the following table. 

<br>

**Table 1: List of required materials for running iMAP pipeline**

| **Requirement**    | **Description**   |  **Location** | **Remarks**          |
| :--------------------   | :-------------------------------------------------------------   |  :---------------: | :------------:   |
| **Raw data**      | Demultiplexed reads in FASTQ format with primers and barcodes removed        |  data/references   |               |
| **Sample metadata**      | A tab-separated file showing sample identifiers, categorical, numeric variables, description...        |  data/metadata        |          |
| **Mapping file**      | A file that links sample IDs (1st column) to the names of forward (2nd column) and reverse (3rd column) data files   |  data/references   |                    |
| **Software**      |    |      ||
| *Docker*       | For Docker containers wrap up software and its dependencies .    |   | [Link](https://docs.docker.com/v17.12/install)  |
| *seqkit*       | For inspecting rawdata format and simple statistics.    |  docker images: readqctools  | [Link](https://cloud.docker.com/repository/list/)  |
| *FastQC*      | For creating base call quality score images and statistics. Requires the latest Java Development Kit ([JDK](https://www.oracle.com/technetwork/java/javase/downloads/jdk11-downloads-5066655.html)).    |  docker images: readqctools | [Link](https://cloud.docker.com/repository/list/)  |
| *bbmap*      | Package containing tools for trimming poor quality reads    |  code  | [Link](https://sourceforge.net/projects/bbmap/files/)*  |
| *multiqc*      | For summarizing FASTQc output    | docker images: readqctools | [Link](https://cloud.docker.com/repository/list)  |
| *Mothur*      | For sequence processing, taxonomy assignment and preliminary analysis    |  docker images: mothur:1.41.3 | [Link](https://cloud.docker.com/repository/list ) |
| **Statistical analysis and visualization**     | |  |  |
| *R*      | For statistical analysis and visualization    | docker image:rpackages:3.5.2  | [Link](https://cran.r-project.org/)  |
| *iTOL*      | For displaying, annotating and managing phylogenetic trees   | |   [Link](http://itol.embl.de/)  |
| **Reference 16S rRNA gene alignments**   |  |  |      |
| *SILVA* (nr)   | Reference rRNA alignments    |   data/references  | [Link](https://www.mothur.org/w/images/3/32/)  |
| *SILVA* (seed)   | Reference rRNA alignments    |   data/references  | [Link](https://www.mothur.org/w/images/7/71/)  |
| **Reference 16S rRNA gene classifiers**   |    |      ||
| *SILVA*(de-gapped)     | mothur-formatted  |   data/references   ||
| *SILVA NR*     | QIIME2-formatted  |   data/qiime2   || [Link](https://data.qiime2.org/2018.11/common/silva-132-99-nb-classifier.qza)
| *RDP*      | Mothur-formatted  |   data/references   |[Link](https://www.Mothur.org/wiki/RDP_reference_files ) |
| *Greengenes*     | Mothur-formatted  |   data/references   |[Link](https://www.Mothur.org/wiki/Greengenes-formatted_databases) |
| *Greengenes*     | QIIME2-formatted  |   data/qiime2   |[Link](https://data.qiime2.org/2018.11/common/gg-13-8-99-nb-classifier.qza) |
| *EzBioCloud*     | Mothur-formatted  |   data/references   |[Link](https://www.ezbiocloud.net/resources)  ||
| *Custom classifiesr*     | Any manually built classifiers. Highly recommended when studying a specific group of known microbes.  | data/references ||
|||||
*BBmap is pre-downloaded


<br>

Before working with iMAP, docker must be installed as instructed at this link: https://docs.docker.com/v17.12/install/

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

### Verify required folders and files
```{}

bash code/requirements/04_check_folders_and_files.bash

```
<br>

## Download required Docker images 

```{}

bash code/dockerImages.sh

```


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


### Transformation of taxonomy data
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

```{r label, out.width = "85%", fig.cap = "Figure1"}
knitr::include_graphics("img/Figure1.pdf", auto_pdf = getOption("knitr.graphics.auto_pdf", TRUE), dpi = NULL)
```
