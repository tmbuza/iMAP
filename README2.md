>This README2 describes a work under active development. Visit this page regularly for more updates.

<br>

# MICROBIOME DATA ANALYSIS

<br>

## Generalized iMAP Workflow 

... In Progress ...
<!-- [PDF image](https://github.com/tmbuza/iMAP/blob/master/img/iMAP-workflow.pdf) -->
<!-- <img src="https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-workflow.png"> -->

<br>
<hr>
<br>

## Running Analysis within Docker Container (Default)
* Requires Docker Images.
* Runs on both Windows and Linux applications.
* Uses less resources but memory-intensive computing may sometimes fail.
* All analyses are run interactively on container’s Command-line.
* The iMAP folder is by default the working directory and is readable from the container.
* The output is stored in the working directory which mean it can be accessed ouside the container.

> Important: Graphical applications don't work well in Docker containers. 
> Some R-packages do not install well when creating docker images.


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
More nstructions: [README](https://github.com/tmbuza/iMAP/blob/master/README.md) (iMAP-master).


<br>
<hr>
<br>

## Running Analysis On Specific Platforms (Best option)

[README](https://github.com/tmbuza/iMAP/blob/master/README2.md) for all platforms (this document).

* Best option for integrating most applications
* Uses RStudio to install R-packages (recommended)
* No Docker images are required.
* May probably require manual installation of some tools.

<br>
<br>


### Step 1: Set-up the configuration file

By default most of the executable files are saved or soft-linked to the $HOME/bin directory. 

```{}
# If bin folder does not exist please create it

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

### Step 2: Install software

The following script installs the executable tools integrated in the pipeline, including seqkit, fastqc, bbmap, multiqc and mothur. The script does not include R or RStudio which must be intalled manually by the user. QIIME2 will be added in the later version.

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

>If the auto-install failed, please try to do it manually. Each of the tools below is hyperlinked to lead you to its download site.  

* [Install seqkit](https://github.com/shenwei356/seqkit/releases/tag/v0.11.0). 
* [Install fastqc](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/).
* [Install bbmap](https://sourceforge.net/projects/bbmap/).
* [Install multiqc](https://multiqc.info/docs/#manual-installation).
* [Install mothur](https://github.com/mothur/mothur/releases/tag/v.1.43.0).
* QIIME2: In progress. Docker image is available [here](https://hub.docker.com/r/tmbuza/qiime2core).

<br>
<br>

**Install R & RStudio (Required)**

* [Install R](https://cran.r-project.org/)
* [Install RStudio](https://rstudio.com/products/rstudio/download/)

<br>
<br>

### Step 3: Dowload the pre-built binary suitable for your platform

<br>
<br>

#### MAC OS X (in progress)
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

#### Unix-Linux environments (in progress)
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

#### Windows 10 with linux WSL-bash (in progress)

```{}

curl -LOk https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Windows10-WSL.v1.0.zip
unzip Windows10-WSL.v1.0.zip
mv iMAP-Windows10-WSL.v1.0 iMAP
rm -f Windows10-WSL.v1.0.zip
cd iMAP


# OR

wget --no-check-certificate https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Windows10-WSL.v1.0.zip
unzip iMAP-Windows10-WSL.v1.0.zip
mv iMAP-Windows10.v1.0 iMAP
rm -f Windows10-WSL.v1.0.zip
cd iMAP
```
<br>
<br>

#### Windows 10 with GIT bash (in progress)

```{}

curl -LOk https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Windows10-GIT.v1.0.zip
unzip iMAP-Windows10-GIT.v1.0.zip
mv iMAP-Windows10-GIT.v1.0 iMAP
rm -f iMAP-Windows10-GIT.v1.0.zip
cd iMAP


OR

wget --no-check-certificate https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Windows10-WSL.v1.0.zip
unzip iMAP-Windows10-GIT.v1.0.zip
mv iMAP-Windows10-GIT.v1.0 iMAP
rm -f iMAP-Windows10-GIT.v1.0.zip
cd iMAP
```

<br>
<br>

### Step 4: Add required files to designated folders
* Place the rawdata, metadata, mapping files, reference alignments, and classifiers in the designated folders. See Table 1 in the [README](https://github.com/tmbuza/iMAP/blob/master/README.md) file.
* Highly recommended testing your system with the demo data loaded into the designated folders using the following command:
```{}
bash ./code/00_2_GetDemoDataDriver.bash
```

<br>
<br>

### Step 5: Check folders and files to be certain
> important!. Do not start the next step unless all the requirements are met. Make sure that you don’t have any missing file required for the downstream analysis. Repeat this step as necessary.

```{}
bash ./code/00_3_CheckFilesDriver.bash
```

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

#### Progress report 1: Metadata profiling
--- Details: In-progress ---

<br>
<br>
<hr>

## BIOINFORMATICS ANALYSIS
* **Mode 1: Interactively on CLI**
   * Users sequentially run individual or the bundled scripts on CLI (Command-Line-Interface). 

> Interactive mode allows investigators to review the results progressively and make well-informed decisions.

* **Mode 2: Remotely on HPC (in-progress)**
   * Requires a job scheduling script to submit to the HPC queue, to allocate the available computing resources, and to request additional resources.

<br>
<br>

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

#### Progress report 2: Read Preprocessing 
--- Details: In-progress ---

<br>
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

* Classifying the sequences and performing post-classification quality control.

```{}
bash ./code/01_3_ClassifySeqDriver.bash
```

<br>

#### Progress report 3: Sequence Processing 
--- Details: In-progress ---

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

#### Progress report 4: Preliminary Analysis 
--- Details: In-progress ---


<br>
<br>
<hr>

## Running Analysis Remotely on HPC
* Requires a job scheduling script.
* The Portable Batch System (PBS) is the most used workload management solution for HPC systems and Linux clusters. 
* The **qsub** command scans the lines of the PBS job scheduling script for directives or instructions.
* Below is a sample PBS script. Replace the parameters in the script to match your systems.

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

The above PBS submit script specifies:  

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
<br>
<hr>

## IN-DEPTH ANALYSIS, VISUALIZATION & REPORTING (In progress)
The output from preprocessing and bioinformatics analysis is analyzed and visualized via the RStudio IDE (Integrated Development Environment). The entire analysis is summarized in a single HTML report or in a pre-specified format using Rmarkdown.

* Useful site for Q&A: [RStudio Community](https://community.rstudio.com/)

<hr>
<br>
<br>
