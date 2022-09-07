# iMAP: Integrated Microbiome Analysis Pipeline

## :tada:Improved iMAP DEMOs!
The original pipeline is being restructured and updated with more improved workflows. The updated version will replace the existing pipeline. Please consider this as an on-going process of finding better and integrated solutions for microbiome data analysis.


|Repo| Description| Repo Output|
|-------------------------|---------------------------------------------------|-----------------|
| iMAP-PART1 | How to Get Started with Microbiome Data Analysis | [eBook](https://complexdatainsights.com/books/microbiome-analysis/getting-started) |
| iMAP-PART2 | Bioinformatics Analysis of Microbiome Data | [eBook](https://complexdatainsights.com/books/microbiome-analysis/bioinformatics-analysis) |
| iMAP-PART3 | Data Preprocessing | [eBook](https://complexdatainsights.com/books/microbiome-analysis/data-preprocessing) |
| iMAP-PART4 | Exploratory Analysis of Microbiome Data | [eBook](https://complexdatainsights.com/books/microbiome-analysis/exploratory-analysis) |


## Citation
> Please consider citing the [iMAP article](https://rdcu.be/b5iVj) if you find any part of the iMAP practical user guides helpful in your analysis:

Teresia M. Buza, Triza Tonui, Francesca Stomeo, Christian Tiambo, Robab Katani, Megan Schilling, Beatus Lyimo, Paul Gwakisa, Isabella M. Cattadori, Joram Buza and Vivek Kapur. iMAP: an integrated bioinformatics and visualization pipeline for microbiome data analysis. BMC Bioinformatics (2019) 20:374. [Free Full Text](https://pubmed.ncbi.nlm.nih.gov/31269897/).


<br>

## Running Analysis within Docker Container (Default)
* See [GH-Page](https://tmbuza.github.io/iMAP/) for step-by-step instructions.
	* Requires Docker Images and Docker containers CLI.
	* Uses less resources but memory-intensive computing may sometimes fail.
	* All analyses are run interactively on container’s Command-line.
	* The iMAP folder is by default the working directory and is readable from the container.
	* The output is stored in the working directory which mean it can be accessed ouside the container.
* Important: Graphical applications don't work well in Docker containers. 
* Some R-packages that install perfectly in RStudio may not install correctly in docker images.

<br>
<hr>
<br>

## Running Analysis On Specific Platforms (Best option)
* This README is work in progress. Please visit this page regularly for more updates.
* No Docker images are required.
* May probably require manual installation of some tools.
* Uses RStudio to install required R-packages.

<br>
<br>


### Step 1: Set-up the configuration file

By default most of the executable files are saved or soft-linked to the $HOME/bin directory. If bin folder does not exist please create it 

```{}
cd ~/
ls -al
mkdir bin
```

<br>

#### Required configuration files:

* *.bash_profile*: A hidden file executed for login shells before running any command argument. Is more common in Mac OS X. 

* *.bashrc*: A hidden file executed for interactive non-login shells before running any command argument. Is more common in Unix-Linux. 

>In MAC we will set the PATHs in the *.bashrc* file, then source it from the *.bash_profile* file. 

```{}
cd ~/
ls -al

# If the two config files do not exist please create them.

touch ~/.bashrc

# See if the $HOME/bin is in the $PATH.

echo $PATH

# If not add $HOME/bin line to the *.bashrc* file. 

export PATH=$PATH:$HOME/bin

touch ~/.bash_profile

# Add the following line to the *.bash_profile* file. 

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
```

<br>
<br>

### Step 2: Dowload the pre-built binary suitable for your platform

<br>
<br>

#### iMAP for MAC OS X (Updated July 8, 2020)
```{}

curl -LOk https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Mac-OSX.v1.0.zip
unzip iMAP-Mac-OSX.v1.0.zip
mv iMAP-Mac-OSX.v1.0 iMAP
rm -f iMAP-Mac-OSX.v1.0.zip
cd iMAP


# OR

wget --no-check-certificate https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Mac-OSX.v1.0.zip
unzip iMAP-Mac-OSX.v1.0.zip
mv iMAP-Mac-OSX.v1.0 iMAP
rm -f iMAP-Mac-OSX.v1.0.zip
cd iMAP
```

<br>
<br>

#### iMAP for Unix-Linux environments (in progress)
```{}

curl -LOk https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-UnixLinux.v1.0.zip
unzip iMAP-UnixLinux.v1.0.zip
mv iMAP-UnixLinux.v1.0 iMAP
rm -f iMAP-UnixLinux.v1.0.zip
cd iMAP


# OR

wget --no-check-certificate https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-UnixLinux.v1.0.zip
unzip iMAP-UnixLinux.v1.0.zip
mv iMAP-UnixLinux.v1.0 iMAP
rm -f iMAP-UnixLinux.v1.0.zip
cd iMAP
```


<br>
<br>

#### iMAP for Windows 10 with linux WSL-bash (in progress)

```{}

curl -LOk https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Windows-10-WSL.v1.0.zip
unzip iMAP-Windows-10-WSL.v1.0.zip
mv iMAP-Windows-10-WSL.v1.0 iMAP
rm -f iMAP-Windows-10-WSL.v1.0.zip
cd iMAP


# OR

wget --no-check-certificate https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Windows-10-WSL.v1.0.zip
unzip iMAP-Windows-10-WSL.v1.0.zip
mv iMAP-Windows-10.v1.0 iMAP
rm -f iMAP-Windows-10-WSL.v1.0.zip
cd iMAP
```
<br>
<br>


### Step 3: Install iMAP dependencies

The following script installs the executable tools integrated in the pipeline, including seqkit, fastqc, bbmap, multiqc and mothur. The script does not include R or RStudio which must be installed manually by the user.

> Users who prefer to use Portable Batch System (PBS) or similar methods may seek advices from their system administrators.

```{}
bash ./code/00_1_InstallSoftwareDriver.bash
```
<br>

**Confirm the installation**

Make sure that all executable tools are being discovered by the system. Simply use *which* or *type -p* function to see the location.

```{}
which seqkit # must show the location of seqkit
which fastqc # must show the location of fastqc
which bbduk.sh # must show the location of bbduk.sh
which multiqc # must show the location of multiqc
which mothur # must show the location of fastqc
which vsearch # must show the location of vsearch
which uchime # must show the location of uchime
``` 

<br>

>If the auto-install failed, please try to do it manually. Each of the tools below is hyperlinked to lead you to its download site. Please install the latest stable version.

* [Install seqkit](https://github.com/shenwei356/seqkit/releases/tag/v0.11.0). 
* [Install fastqc](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/).
* [Install bbmap](https://sourceforge.net/projects/bbmap/).
* [Install multiqc](https://multiqc.info/docs/#manual-installation).
* [Install mothur](https://github.com/mothur/mothur/releases/tag/v.1.43.0).
* QIIME2: In progress. Docker image tags are available [here](https://hub.docker.com/r/tmbuza/qiime2core/tags).

<br>

**Additional installation for future analyses**

* [Anaconda](https://docs.anaconda.com/anaconda/install/): We recommend to install Anaconda for the local user as no administrator permissions are required.

<br>
<br>

**Install R & RStudio (Required)**

* [Install R](https://cran.r-project.org/)
* [Install RStudio](https://rstudio.com/products/rstudio/download/)

<br>
<br>

### Step 4: Add data to designated folders 
This [Table](https://www.microbiome-bioinfo.com/iMAP/Resources/imapmaterial.html) provide useful information to help you place data in correct folders. Use the new versions if available.

<br>

**Using demo data**

>The following command copy the required data files located in the iMAP/resources/ and place them in their respective locations.

```{}
bash ./code/00_2_GetDemoDataDriver.bash
```

<br>

### Step 5: Check missing folders or files
> Run checkFiles command everytime you want to verify any missing files. Add all missing files and check again untill everything looks ok.

```{}
bash ./code/00_3_CheckFilesDriver.bash 
```

<br>

**What to replace**

* Rawdata: data/raw/
* Metadata: data/metadata/
* Mapping files: data/metadata/

>Re-run checkFiles command everytime you change the original data files. It is important to maintain the format presented by the demo data.

```{}
bash ./code/00_3_CheckFilesDriver.bash
```

**Changing default settings**

>Users who want to change the default settings may do so using any text editor. Use [this table](https://www.microbiome-bioinfo.com/iMAP/Resources/defaultsettings.html) to locate files with default parameters that may be altered. 

<br>
<br>
<hr>

## METADATA EXPLORATORY ANALYSIS

<br>

### Step 6: Metadata profiling
This step helps you to: 

* Discover if data is suitable for analysis.
* Identify and correct issues.
* Uncover if additional formatting is needed.
* Make decision on whether to change anything before proceeding with the analysis.

<br>

**Progress report 1: Metadata profiling**
```{block}
Skip for now!
This chunk will hold an R script that generates Progress report 1: Metadata profiling
bash code/01_metadataProfiling_driver.bash
```

<br>
<br>
<hr>


## READ QUALITY CONTROL

### Step 7: Read Preprocessing
- Computing simple statistics of the raw reads 
- Inspecting base quality scores of original reads (qc0)
- Filtering and trimming poor reads. Phred Score = 25 or more (qctrim25: default)
- Removing phiX contamination (qced)
- Summarizing Base Call Phred scores graphically
  
```{}
bash ./code/01_1_ReadPreprocessDriver.bash
```

<br>

**Progress report 2: Read Preprocessing**
```{block}
Skip for now!
This chunk will hold an R script that generates Progress report 2: Read Preprocessing
```

<br>
<br>

## BIOINFORMATICS ANALYSIS

## A: Interactively on CLI
* Users sequentially run individual script or the bundled scripts on CLI (Command-Line-Interface). 
* Interactive mode allows investigators to review the results and make well-informed decisions, progressively.

<br>

### Step 8: Microbial Profiling

**Sequence processing**

* Assembling of the forward and reverse reads, screen by length and create representative sequences.
* Aligning the representative sequences with reference alignments. Default SILVA seed.
* Denoising to remove poor alignments.
* Removing Chimeric sequences.

```{}
bash ./code/01_2_SeqProcessingDriver.bash
```


**Sequence classification**

* Taxonomic classification of the sequences
* Post-classification quality control.


```{}
bash ./code/01_3_ClassifySeqDriver.bash
```

<br>

**Progress report 3: Microbial Profiling**
```{block}
Skip for now!
This chunk will hold an R script that generates Progress report 3: Sequence Processing
```

<br>
<br>

### Step 9: Preliminary Analysis

* Clustering the OTUs (97% identity).
* Assigning taxonomy names to observed OTUs.
* Useful link: [Mothur MiSeq SOP: Preparing for analysis](https://www.mothur.org/wiki/MiSeq_SOP#Preparing_for_analysis).

<br>

**Phylotype method** (Recommended) 

```{}
bash ./code/01_4_PhylotypeBasedTaxaDriver.bash
```

<br>

**Cluster-based method** (Memory-intensive)

```{}
bash ./code/01_5_ClusterBasedTaxaDriver.bash
```

<br>

**Phylogeny method** (Memory-intensive)

```{}
bash ./code/01_6_PhylogenyBasedTaxaDriver.bash
```

<br>

**Progress report 4: Preliminary Analysis**
```{block}
Skip for now!
This chunk will hold an R script that generates Progress report 4: Preliminary Analysis 
```
<br>
<br>
<hr>

## B: Remotely on HPC
* Complete step 1-4 above
* FYI the Portable Batch System (PBS) is the most used workload management solution for HPC systems and Linux clusters. To certain, check with your system administrator.
* Create a job scheduling i.e. PBS script (or similar) for:
	* submitting a job to the HPC queue
	* allocating the available computing resources, and 
	* requesting additional resources.
* Submit the job using a **qsub** command. This command scans the lines of the PBS job scheduling script for directives or instructions.

**Sample PBS script**

>Replace the parameters in the script to match your systems.

```{}
#!/bin/bash -f
#PBS -N [JobID]
#PBS -A [group allocation name]
#PBS -l nodes=1:ppn=10
#PBS -l walltime=3:00:00
#PBS -l pmem=10gb
#PBS -j oe
#PBS -o [Output file]
#PBS -M [Email address]
#PBS -m bea

cd $PBS_O_WORKDIR

bash ./code/01_1_ReadPreprocessDriver.bash
bash ./code/01_2_SeqProcessingDriver.bash
bash ./code/01_3_ClassifySeqDriver.bash
bash ./code/01_4_PhylotypeBasedTaxaDriver.bash
bash ./code/01_5_ClusterBasedTaxaDriver.bash
bash ./code/01_6_PhylogenyBasedTaxaDriver.bash

exit 0
```

**Description of the PBS code**

The above PBS script specifies:  

* The environment to use (#!/bin/bash -f)
* The name of the job (#PBS -N JobID)
* The group allocation name (#PBS -A group allocation name)
* Ten processors to run on a single node (#PBS -l nodes=1:ppn=10)
* Three walltime hours (#PBS -l walltime=3:00:00)
* Ten gigabytes of memory (#PBS -l pmem=10gb)
* Joins the error and output in a single file (#PBS -j oe)
* Writes the output in a text file named iMAPtutorial.txt (#PBS -o iMAPtutorial.txt)
* Instructs the PBS manager to send message to a specified email address when the job (b)egins, (e)xits or (a)borts (bea) (#PBS -m bea). 
* Instructs the PBS manager to send the notification emails to the specified email.
* The working directory (cd $PBS_O_WORKDIR)
* The code or individual scripts to be executed
* Finally, the PBS manager will instruct the system to exit once the execution is done (exit 0).


<br>
<hr>
<br>


## IN-DEPTH ANALYSIS, VISUALIZATION & REPORTING (In progress)
The output from preprocessing and bioinformatics analysis is analyzed and visualized via the RStudio IDE (Integrated Development Environment). The entire analysis is summarized in a single HTML report or in a pre-specified format using Rmarkdown.

<br>
<hr>


## Related Links

| URLs | Description | Status |
|-------|--------------------| --------- |
|[Manuscript](https://rdcu.be/b5iVj) | In BMC Bioinformatics | Software |
|[README](https://github.com/tmbuza/iMAP/blob/master/README.md/) | Guidelines | iMAP README |

<hr>
<br>


## Citation
Teresia M. Buza, Triza Tonui, Francesca Stomeo, Christian Tiambo, Robab Katani, Megan Schilling, Beatus Lyimo, Paul Gwakisa, Isabella M. Cattadori, Joram Buza and Vivek Kapur. iMAP: an integrated bioinformatics and visualization pipeline for microbiome data analysis. BMC Bioinformatics (2019) 20:374. [Free Full Text](https://rdcu.be/b5iVj).

