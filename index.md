# Getting Started with iMAP


<!--
### Using specific platform

> Read [README2.md](https://github.com/tmbuza/iMAP/blob/master/README2.md) if you prefer to use a specific platform. README2 guides the implementation of iMAP directly on a specific platform, including Unix-Linux, Mac OS X, and Windows 10. Please note that this is work-in-progress.

<hr>
<br><
-->

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
This [Table](https://www.microbiome-bioinfo.com/iMAP/Resources/imapmaterial.html) provide useful information to help you place data in correct folders.

<br>

**Using demo data**

>The following command copy the required data files located in the iMAP/resources/ and place them in their respective locations.

```{}
bash iMAP/code/00_allDemo_data.bash
```

<br>

### Check missing folders or files
> Run checkFiles command everytime you want to verify any missing files. Add all missing files and check again untill everything looks ok.

```{}
bash iMAP/code/00_checkFiles_driver.bash 
```

<br>

### What to replace
* Rawdata: iMAP/data/raw/
* Metadata: iMAP/data/metadata/
* Mapping files: iMAP/data/metadata/

>Re-run checkFiles command everytime you change the original data files. It is important to maintain the format presented by the demo data.

```{}
bash iMAP/code/00_checkFiles_driver.bash
```

### Changing default settings

>Users who want to change the default settings may do so using any text editor. Use [this table](https://www.microbiome-bioinfo.com/iMAP/Resources/defaultsettings.html) to locate files with default parameters that may be altered. 


<br>
<hr>

# Using Docker Images

## Install Docker Desktop
Link: [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/).

### Set up Docker Account
* Docker ID grants you access to Docker Hub repositories. All you need is an email address.
* Register for a Docker ID at [https://docs.docker.com/docker-id/](https://docs.docker.com/docker-id/).

### Confirm the installation
* If the commands below work, then you are all set.
```{}
docker login
docker info
```

<!-- ### Starting the Docker in daemon mode
```{}
choose Application > Start "Docker Daemon"
``` -->

<br>
<hr>
<br>

# Metadata profiling

### Download rpackage image
```{}
docker pull tmbuza/rpackages:v3.5.2
```

### Create a container for bash CLI<br>
```{}
containerName=metadataprofile
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  tmbuza/rpackages:v3.5.2 /bin/bash
```

### Start profiling metadata
```{}
bash code/01_metadataProfiling_driver.bash
```

### Exit the container
```{}
exit
```


**Progress report 1: Metadata profiling**
```{block}
Skip for now!
This chunk will hold an R script that generates Progress report 2: Read Preprocessing
bash code/01_metadataProfiling_driver.bash (Being updated to run outside Docker container)
```

<br>

# Read Quality Control

### Download reaad QC image
```{}
docker pull tmbuza/readqctools:v1.0.0
```

### Create a container for  bash CLI
```{}
containerName=readpreprocess
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap tmbuza/readqctools:v1.0.0 /bin/bash
```

### Start read preprocessing
```{}
bash code/02_readPreprocess_driver.bash
```

### Exit the container
```{}
exit
```

### View MultiQC report
> Make sure you exited the container which is done by running *exit* command above. That will bring you back to your normal CLI. The HTML QC-summary report (multiqc_report.html) is stored in the **iMAP/results/multiqc/ folder**. You can open the HTML report(s) using your favorite browser or try to open it using CLI like:

```{}
open iMAP/results/multiqc/qced/R1/multiqc_report.html
```

<br>

**Progress report 2: Read Preprocessing**
```{block}
Skip for now!
This chunk will hold an R script that generates Progress report 2: Read Preprocessing
bash 02_readPreprocess_driver.bash  (Being updated to run outside Docker container)
```

<br>
<hr>

# Microbial Profiling
<hr>
<br>

## A: MOTHUR-BASED PIPELINE
* Requires a Mothur-formatted classifer. 
* Default classifier is a recreated seed from [Silva database](https://mothur.org/wiki/silva_reference_files/).
* You can use different classifiers from [other Mothur taxonomy outlines](https://mothur.org/wiki/taxonomy_outline/).

<!-- # ### Download reference databases (Silva seed alignment & classifier)
# ```{}
# bash iMAP/code/refdatabase/iMAP_download_driver.bash
# ```

# ### Check files
# ```{}
# bash iMAP/code/00_checkFiles_driver.bash
# ```-->
 
### Download Mothur images
```{}
docker pull tmbuza/mothur:v1.41.3
```

### Create a container for bash CLI
```{}
containerName=mothurseqprocessing
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap tmbuza/mothur:v1.41.3 /bin/bash
```

### Start sequence processing and classification 
The sequence processing and classification command will implement the folllowing:

* Assemble the forward and reverse reads, screen by length and create representative sequences
* Align representative sequences with reference alignments..
* Denoise to remove poor alignments
* Remove Chimeric sequences.
* Classify the sequences and do post-classification QC.
* Estimates the sequencing error rate.

```{}
bash ./code/03_imapClassifySEQ_driver.bash 
```
> You may see a lot of WARNINGS. It is safe to ignore them. Also, the program is set to remove all temporary files after processing the sequences. If no any temporary file found you will see an error message that reads: *rm: cannot remove '*.temp': No such file or directory*. Just ignore it.

<br>

### Pick a method for OTU clustering and taxonomy assignement

**Method 1**: Phylotype-based method (works for large and small dataset).
    
```{}
bash ./code/04_1_phylotype_driver.bash
```
<br>

**Method 2**: OTU-cluster method (works best for small dataset).
    
```{}
bash ./code/04_2_otucluster_driver.bash
```

<br>

**Method 3**: Phylogeny-based method (works best for small dataset).
    
```{}
bash ./code/04_3_phylogeny_driver.bash
```

<hr>

*End of Mothur-based bioinformatics pipeline!*

<hr>
<br>
<br>

## B: QIIME2-BASED PIPELINE

* Must install iMAP repo first which will automatically create a directory named **iMAP**.
* Requires a QIIME2 trained classifer. Default: Greengenes 515-806 conservative fragments
* You can train your own classifier using the [q2-feature-classifier](https://github.com/qiime2/q2-feature-classifier).
* Classifier: Naive Bayes classifiers trained on GreenGenes or SILVA database with 99% OTUs. 


<!-- ### Install iMAP repo (if not installed)
```{}
wget --no-check-certificate https://github.com/tmbuza/iMAP/archive/master.zip 
unzip master.zip
mv iMAP-master iMAP
rm -rf master.zip
```

### Load demo data
```{}
bash iMAP/code/demo_data.bash
```

### Download 515-806 conservative fragments
  * This is iMAP default classifier due to its small size.
  * Can be spanned by sequencing 200–300 nt from both ends using Illumina MiSeq.

  > Larger classifiers can cause memory issues which can ultimately kill a running instance.

```{}
bash iMAP/code/qiime2/qiime2-99-515-806-nb-classifier.bash
``` -->

>If using other pretrained QIIME2-formatted classifiers you must replace the default file with the filename containing your favorable classifier. It is safe to do so when outside the container. Path: iMAP/code/qiime2/gg-13-8-99-515-806-nb-classifier.qza.

<br>

### Download QIIME2 images
> Credit goes to the QIIME2 team for developing the qiime2core images. If you want you can pull different tag of the qiime2/core image directly from [QIIME2 docker repository](https://hub.docker.com/r/qiime2/core/tags). Please note that, pulling a different tag from docker hub may require version-compartible trained OTU classifier.

<!--
```{}
docker pull tmbuza/qiime2core:v2020.2
``` -->

```{}
docker pull qiime2/core:2020.6
```

### Create QIIME2 container
```{}
containerName=qiime2classification
docker run --rm --name=$containerName -it -v $(pwd)/iMAP:/imap --workdir=/imap  qiime2/core:2020.6 /bin/bash
```

### Start the analysis
```{}
bash code/qiime2/qiime2.bash
```

### View Progress
```{}
# While inside the container
cat LOG/qiime2logfile.txt

# While outside the container
cat iMAP/LOG/qiime2logfile.txt

# or locate the text file named *qiime2logfile.txt* in the iMAP/LOG folder and open it manually.
```

### Exit the QIIME2 container
```{}
exit
```

### View QIIME 2 results
* Output path: iMAP/data/qiime2/results/
* Use client-side interface: [https://view.qiime2.org/](https://view.qiime2.org/) to view the results (see image below).
* Simply drag and drop the QIIME 2 artifacts (.qza files) or the visualizations (.qzv files). 
* For more help visit [https://view.qiime2.org/about](https://view.qiime2.org/about).

<br>

![Screenshot](img/qiime2view.png)

<hr>

*End of QIIME2-based bioinformatics pipeline!*

<hr>
<br>


<br>
<hr>

# Post-Classification Analysis
<h3><maroon>In Process</maroon></h3>

<hr>
<br>

## Related Links

| URLs | Description | Status |
|-------|--------------------| --------- |
|[Manuscript](https://rdcu.be/b5iVj) | In BMC Bioinformatics | Software |
|[README](https://github.com/tmbuza/iMAP/blob/master/README2.md/) | Guidelines | Quick user's guide ||
[Practical guide](https://www.microbiome-bioinfo.com/microbiomeanalysis/) | Systematic Microbiome data analysis  | eBook, coming in 2021 |
|[Useful link](https://www.microbiome-bioinfo.com/) | Consulting Services | In Progress |

<hr>
<br>


## Citation
Teresia M. Buza, Triza Tonui, Francesca Stomeo, Christian Tiambo, Robab Katani, Megan Schilling, Beatus Lyimo, Paul Gwakisa, Isabella M. Cattadori, Joram Buza and Vivek Kapur. iMAP: an integrated bioinformatics and visualization pipeline for microbiome data analysis. BMC Bioinformatics (2019) 20:374. [Free Full Text](https://rdcu.be/b5iVj).

<br>
<hr>

## Useful Links
<oL>
	<li></li>
	<li></li>
	<li></li>
	<li></li>
</ol>


