>This README2 describes a work under active development. Visit this page regularly for more updates.

<br>

## Running Analysis Outside DOCKER Images

<hr>
<br>
<br>

### Dowload Package suitable for your platform

<br>

#### MAC OS X package
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

#### Unix-Linux package
```{}

curl -LOk https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-UnixLinux.v1.0.zip
unzip iMAP-UnixLinux.v1.0.zip
mv iMAP-UnixLinux.v1.0 iMAP
rm -rf *iMAP-*
cd iMAP


# OR

wget --no-check-certificate https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-UnixLinux.v1.0.zip
unzip iMAP-UnixLinux.v1.0.zip
mv iMAP-UnixLinux.v1.0 iMAP
rm -rf *iMAP-*
cd iMAP
```


<br>
<br>

#### Windows 10 package (in progress)
```{}

curl -LOk https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Windows10.v1.0.zip
unzip iMAP-Windows10.v1.0.zip
mv iMAP-Windows10.v1.0 iMAP
rm -rf *iMAP-*
cd iMAP


# OR

wget --no-check-certificate https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Windows10.v1.0.zip
unzip iMAP-Windows10.v1.0.zip
mv iMAP-Windows10.v1.0 iMAP
rm -rf *iMAP-*
cd iMAP
```

<br>
<br>
<hr>

## REQUIREMENTS

<hr>
<br>

### Step1: Install required software
The following script installs the executable tools integrated in the pipeline, including, [seqkit](https://github.com/shenwei356/seqkit/releases/tag/v0.11.0), [fastqc](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/), [bbmap](https://sourceforge.net/projects/bbmap/), [multiqc](https://multiqc.info/docs/#manual-installation), and [mothur](https://github.com/mothur/mothur/releases/tag/v.1.43.0). If the installation fails, please try to install it manually. Each tool name is hyperlinked to lead you to its site.  

```{}
bash ./code/00_1_InstallSoftwareDriver.bash
```

### Step 2: Add data and reference databases
* Place the rawdata, metadata, mapping files, reference alignments, and classifiers in the designated folders.
* Highly recommended testing your system with the demo data loaded using the following command:
```{}
bash ./code/00_2_GetDemoDataDriver.bash
```

### Step 3: Check folders and files to be certain
> Repeat this step as necessary.

```{}
bash ./code/00_3_CheckFilesDriver.bash
```

<br>
<br>
<hr>

## MICROBIOME DATA ANALYSIS 
We have bundled workflow-specific scripts into a driver script to make the analysis easily implemented sequentially on CLI and on Rstudio environment. Interactive mode (recommended) allows investigators to review the results progressively and make well-informed decisions. We also provide an example of job scheduling script for running analysis remotely on HPC computing nodes. 

<br>

### Mode 1: Running analysis interactively on CLI
Users sequentially run individual or bundled scripts on CLI (Command-Line-Interface). Interactive mode allows investigators to review the results progressively and make well-informed decisions.

### Node 2: Running analysis Remotely on HPC (Not tested)
* Requires a job scheduling script to submit to the HPC queue, to allocate the available computing resources, and to request additional resources. 

<br>
<br>

## Major Steps
1. **PreProcessing.**
2. **Sequence Processing and Classification.**
3. **OTU Preliminary Analysis.**
4. **In-depth OTU Analysis, Visualization, and Reporting.**

<hr> 
<br>


### 1.0: Preprocessing
The preprocessing step includes: 

  * Metadata profiling
  * Computing simple statistics of the raw reads 
  * Inspecting base quality scores of original reads (qc0)
  * Filtering and trimming poor reads. Phred Score = 25 or more (qctrim25: default)
  * Removing phiX contamination (qced)
  * Summarizing Base Call Phred scores graphically
  
```{}
bash ./code/01_1_ReadPreprocessDriver.bash
```

<br>

### 2.0 Sequence Processing and Classification
The step uses mothur functions to perform the following: 

* Assembling of the forward and reverse reads, screen by length and create representative sequences.
* Aligning the representative sequences with reference alignments. Default SILVA seed.
* Denoising to remove poor alignments.
* Removing Chimeric sequences.
* Classifying the sequences and performing post-classification QC.
* Clustering the OTUs (97% identity) using Phylotype (default), cluster-based or Phylogeny method.
* Assigning taxonomy names to observed OTUs.
```{}
bash ./code/01_2_SeqProcessingDriver.bash
bash ./code/01_3_ClassifySeqDriver.bash
```

<br>

### 3.0  OTU Preliminary Analysis
Useful link: [Mothur MiSeq SOP: Preparing for analysis](https://www.mothur.org/wiki/MiSeq_SOP#Preparing_for_analysis).

<br>

**Phylotype method** (Default) 

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

## Remotely on HPC Using PBS (Portable Batch System) Script
* The Portable Batch System or PBS in short is the most used workload management solution for HPC systems and Linux clusters. 
* The **qsub** command scans the lines of the PBS script file for directives.
* Below is a sample PBS script. Replace the parameters in the script to match your systems.

```{}
#!/bin/bash -f
#PBS -N iMAPtutorial
#PBS -A vxk1_a_g_sc_default
#PBS -l nodes=1:ppn=10
#PBS -l walltime=3:00:00
#PBS -l pmem=10gb
#PBS -j oe
#PBS -o [Output file]
#PBS -M [Email for notification]
#PBS -m bea

cd $PBS_O_WORKDIR

bash ./code/01_1_ReadPreprocessDriver.bash
bash ./code/01_2_SeqProcessingDriver.bash
bash ./code/01_3_ClassifySeqDriver.bash
bash ./code/01_4_PhylotypeBasedTaxaDriver.bash # Default
bash ./code/01_5_ClusterBasedTaxaDriver.bash # Memory intensive but classifies all sequences
bash ./code/01_6_PhylogenyBasedTaxaDriver.bash # Memory intensive but classifies all sequences

```

**Description of the PBS code**

The above PBS submit script specifies:  

* The environment to use (#!/bin/bash -f)
* The name of the job (#PBS -N iMAPtutorial)
* The group allocation name (#PBS -A vxk1_a_g_sc_default)
* Ten processors to run on a single node (#PBS -l nodes=1:ppn=10)
* Three walltime hours (#PBS -l walltime=3:00:00)
* Ten gigabytes of memory (#PBS -l pmem=10gb)
* Joins the error and output in a single file (#PBS -j oe)
* Writes the output in a text file named iMAPtutorial.txt (#PBS -o iMAPtutorial.txt)
* Instructs the PBS manager to send message to a specified email address when the job (b)egins, (e)xits or (a)borts (bea) (#PBS -m bea). 
* Instructs the PBS manager to send the notification emails to tmb72@psu.edu
* The working directory (cd $PBS_O_WORKDIR)
* The code or individual scripts to be executed: # See the list above 
* Finally, the PBS manager will instruct the system to exit once the execution is done (exit 0).


<br>
<br>
<hr>

## 4.0: In-depth OTU Analysis, Visualization, and Reporting
The output from previous analyses is analyzed and visualized using integrated R functions. The entire analysis is summarized in a single HTML report or in a pre-specified format using Rmarkdown.

<hr>
<br>
<br>


 


