# iMAP: Integrated Microbiome Analysis Pipeline

## Version: iMAP v1.0

## Supported Analyses
1. Profiling of Metadata
2. Pre-processing and quality control of paired-reads
3. Sequence processing and classification
* mothur (default)
   * Phylotype-based method (works for any dataset size).
   * OTU-based method (works best for small dataset).
   * Phylogeny-based method (works best for small dataset).
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
| :--------------------------   | :-----------------------------------------------------  |  :---------------: | :------------:   |
| **Raw data**      | Demultiplexed reads in FASTQ format (.gz) with primers and barcodes removed        |  data/raw   |    fastq.gz   |
| **Sample metadata**      | File name: samplemetadata.tsv. A tab-separated file linking sample identifiers to the variables    |  data/metadata    |   Format: mothur and QIIME2    |
| **Mapping files**      | For linking sample IDs to the data files   |  data/metadata   |      |
| <tr><td align="left" colspan="4"><strong>Software</strong> (Most are available via pre-built docker images)</td></tr> |
| *Docker*       | For creating containers that wrap up iMAP dependencies.    | fastq.gz  | [Link](https://docs.docker.com/v17.12/install)  |
| *Seqkit*       | For inspecting rawdata format and simple statistics.    |  docker images: readqctools  | [Link](https://hub.docker.com/r/tmbuza/readqctools)    |  docker images: readqctools | [Link](https://cloud.docker.com/u/tmbuza/repository/list)  |
| *BBduk.sh via BBMap*   | For trimming poor quality reads and removing phiX contamination    |  Auto-loaded at preprocessing step  | [Link](https://sourceforge.net/projects/bbmap/files/)  |
| *MultiQC*      | For summarizing FASTQc output    | docker images: readqctools | [Link](https://hub.docker.com/r/tmbuza/readqctools)  |
| *Mothur*      | For sequence processing, taxonomy assignment and preliminary analysis    |  docker images: mothur:v1.41.3 | [Link](https://cloud.docker.com/repository/docker/tmbuza/mothur ) |
| *QIIME2*      | For sequence processing, taxonomy assignment and preliminary analysis    |  docker images: qiime2core:v2019.1 | [Link]( https://hub.docker.com/r/tmbuza/qiime2core:v2019.1) |
| *R*      | For statistical analysis and visualization    | docker image:rpackages:v3.5.2  | [Link](https://cloud.docker.com/repository/docker/tmbuza/rpackages)  |
| *iTOL*      | For displaying, annotating and managing phylogenetic trees   | Onlline |   [Link](http://itol.embl.de/)  | 
| <tr><td align="left" colspan="4"><strong>Reference databases</strong></td></tr> |
| *SILVA NR* (mothur)   | Mothur-formatted rRNA alignments    |   data/references  | [Link](https://www.mothur.org/w/images/3/32/)  |
| *SILVA NR* (QIIME2)    | QIIME2-formatted classifiers |   data/qiime2   | [Link](https://data.qiime2.org/2018.11/common/silva-132-99-nb-classifier.qza) 
| *SILVA* (seed)   | Mothur-formatted rRNA alignments    |   data/references  | [Link](https://www.mothur.org/w/images/7/71/)  |
| *SILVA*(de-gapped)     | mothur-formatted classifiers |   data/references   | Auto |
| *RDP*      | Mothur-formatted classifiers |   data/references   | [Link](https://www.Mothur.org/wiki/RDP_reference_files ) |
| *Greengenes*     | Mothur-formatted classifiers |   data/references   | [Link](https://www.Mothur.org/wiki/Greengenes-formatted_databases) |
| *Greengenes*     | QIIME2-formatted classifiers |   data/qiime2   | [Link](https://data.qiime2.org/2018.11/common/gg-13-8-99-nb-classifier.qza) |
| *EzBioCloud*     | Mothur-formatted classifiers |   data/references   | [Link](https://www.ezbiocloud.net/resources)  ||
| *Custom classifiesr*     | Any manually built classifiers. Highly recommended when studying a specific group of known microbes.  | data/references ||


<br>

## Get Started

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
#### File formats

1. Metadata: 

    * Compatible for Mothur and QIIME2: [samplemetadata.tsv](https://github.com/tmbuza/iMAP/blob/master/resources/metadata/samplemetadata.demo.tsv)

2. Mapping files:

    * Mothur-format:
 [qced.files](https://github.com/tmbuza/iMAP/blob/master/resources/qced.files)
 
    * QIIME2-format:
 [manifest.txt](https://github.com/tmbuza/iMAP/blob/master/resources/manifest.txt)
 
3. Variable files (Mothur-based preliminary analysis).

    * Variable 1: 
 [var1.design](https://github.com/tmbuza/iMAP/blob/master/resources/metadata/var1.design)
 
    * Variable 2: 
 [var2.design](https://github.com/tmbuza/iMAP/blob/master/resources/metadata/var2.design)

<br>

## Data for optional testing of iMAP
The following command copy the data files from the iMAP/resources/ folder and place them in the their folders as indicated on Table 1 above.
```{}
bash iMAP/demo_data.bash
```

<br>

## User Options
Users who want to change the default settings may do so using any text editor. The table below shows the location of default parameters that may be altered. 

<table>
<thead>
<tr>
<th align="left"><strong>Parameter to change</strong></th>
<th align="left"><strong>File Path</strong></th>
<th align="left"><strong>Filename</strong></th>
<th><strong>Default</strong></th>
</tr>
</thead>
<tbody>

<tr>
<td align="left">Phred score</td><td align="left">iMAP/code/preprocessing</td><td align="left">04_get_highscore_reads.bash</td><td>trimq=25</td>
</tr>

<tr>
<td align="left">Min Contig length</td><td align="left">iMAP/code/seqprocessing</td><td align="left">01_assemble_paired_reads.batch</td><td>minlength=100</td>
</tr>
<tr>
<td align="left">Max Contig length</td><td align="left">iMAP/code/seqprocessing</td><td align="left">01_assemble_paired_reads.batch</td><td>maxlength=300</td>
</tr>
<tr>
<td align="left">Min alignment length</td><td align="left">iMAP/code/seqprocessing</td><td align="left">02_align_for_16S_consensus.batch</td><td>minlength=100</td>
</tr>
<tr>
<td align="left">Max alignment length</td><td align="left">iMAP/code/seqprocessing</td><td align="left">02_align_for_16S_consensus.batch</td><td>maxlength=300</td>
</tr>
<tr>
<td align="left">Reference</td><td align="left">iMAP/code/seqclassification</td><td align="left">01_classify_seqs.batch</td><td>silva.seed.ng.fasta</td>
</tr>
<tr>
<td align="left">Taxonomy</td><td align="left">iMAP/code/seqclassification</td><td align="left">01_classify_seqs.batch</td><td>silva.seed.tax</td>
</tr>
</tr>
<tr>
<td align="left">Classification cutoff</td><td align="left">iMAP/code/seqclassification</td><td align="left">01_classify_seqs.batch</td><td>cutoff=80</td>
<tr>
<td align="left">QIIME2 settings</td><td align="left">iMAP/code/qiime2</td><td align="left">qiime2.bash</td><td>DADA2 QC parameters are set at 0</td>
</tr>
</tr>
</tbody>
</table>


<br>



## Set up Docker
Link: https://docs.docker.com/install/
Register for a Docker ID. Link: https://docs.docker.com/docker-id/

### Download dependencies images
Includes:
1. [rpackages:v3.5.2](https://hub.docker.com/r/tmbuza/rpackages) for R version 3.5.2 and several packages (fundamental units of reproducible visualization).
2. [readqctools:v1.0.0](https://hub.docker.com/r/tmbuza/readqctools) for quality control of the reads.
3. [mothur:v1.41.3](https://hub.docker.com/r/tmbuza/mothur) for sequence classification and generating of mothur-based OTU tables.
4. [qiime2core:v2019.1](https://hub.docker.com/r/tmbuza/qiime2core) for sequence classification and generating of qiime2-based OTU table.

Run the following to install all four images. Alternatively, to install individual image use `docker pull tmbuza/imagename`.
```{}
bash iMAP/code/dockerImages.sh

```

### Confirm the installation
```{}
docker images
```

## Start analysis

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

### Preprocessing progress report
```{}

containerName=report2
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash

bash code/progressreport2.bash

exit

```

### Download reference alignment and classifiers
Default: [SILVA seed](https://www.mothur.org/w/images/7/71/)

```{}
bash iMAP/code/refdatabase/iMAP_download_driver.bash
```

### Sequence Processing and Classification with mothur
```{}

containerName=mothurclassification
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap tmbuza/mothur:v1.41.3 /bin/bash

bash code/03_imapClassifyOTU_driver.bash 

mv mothur.*.logfile LOG

rm *.temp

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

**Preliminary analysis**
```{}

containerName=getotu
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap tmbuza/mothur:v1.41.3 /bin/bash

bash code/04_OTUanalysis_driver.bash 

mv mothur.*.logfile LOG

rm *.temp

exit

```

### Data Transformation
```{}

containerName=datatransformation
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash

bash code/datatransformation.bash

exit

```

### Statistical analysis
> Statistical analysis compares the variables, and variables are very specific and unique in different studies. Below are links to most important statistical analyses in microbiome studies:

* [AMOVA](https://mothur.org/wiki/Amova)
* [HOMOVA](https://mothur.org/wiki/Homova)
* [ANOSIM](https://mothur.org/wiki/Anosim)
* [Kruska-Walis](https://mothur.org/wiki/Kruskal.wallis)
* [Lefse](https://mothur.org/wiki/Lefse)
* [Metastats](https://mothur.org/wiki/Metastats)
* [More...](https://mothur.org/wiki/Category:Commands)



### OTU analysis progress report
```{}

containerName=report4
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash

bash code/progressreport4.bash

exit

```

### Sequence Processing and Classification with QIIME2
```{}

containerName=qiime2classification
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/qiime2:core /bin/bash

bash code/qiime2/qiime2.bash

exit

```

### Convert mothur biom file using QIIME2
The output is a file containing OTUs and taxonomy
```{}

containerName=biomconvertmothur
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/qiime2:core /bin/bash

bash code/qiime2/convertmothur_biom.bash

exit

```

