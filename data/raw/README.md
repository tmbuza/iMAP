<br>

# Running Analysis Outside DOCKER Images

## Platform: Unix-Linux Environments

<hr>
<br>
<br>

### Dowload iMAP-UnixLinux package
```{}

curl -LOk https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-UnixLinux.v1.0.zip
unzip iMAP-UnixLinux.v1.0.zip -d iMAP
rm -rf *iMAP*.zip
cd iMAP


# OR

wget --no-check-certificate https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-UnixLinux.v1.0.zip
unzip iMAP-UnixLinux.v1.0.zip -d iMAP
rm -rf *iMAP*.zip
cd iMAP
```

<br>
<br>
<hr>

## DEPENDENCIES

<hr>
<br>

### Install required software
```{}
bash ./code/00_1_InstallSoftwareDriver.bash
```

### Add data and reference databases
* Place the rawdata, metadata, mapping files, reference alignments, and classifiers in the designated folders.
* Highly recommended testing your system with the demo data loaded using the following command:
```{}
bash ./code/00_2_GetDemoDataDriver.bash
```

### Check folders and files to be certain
```{}
bash ./code/00_3_CheckFilesDriver.bash
```

<br>
<br>
<hr>

## MICROBIOME DATA ANALYSIS 
The iMAP tool starts preprocessing the raw reads by performing rigorous quality filtering. High quality reads then pass through a series of processing steps and more qualitychecking before assigned to known taxonomic labels. The final steps include in-depth OTU analysis, visualization, and reporting.

**Heads-Up:** The iMAP-UnixLinux version runs in two phases due to complications of installing all the required R-packages.

* **Phase I:** Bioinformatics analysis on Unix-Linux environment.

* **Phase 1I:** Analysis of Phase one output on Rstudio environment.

<hr>
<br>
<br>

## Phase I: Interactive mode on Command-Line-interface (CLI)
This is basically a method where users sequentially run individual or bundled scripts on CLI (Command-Line-Interface), **one at a time**. We have bundled workflow-specific scripts into a driver script to make the analysis easily implemented on CLI by just a single click. Interactive mode allows investigators to review the results progressively and make well-informed decisions.

### Read preprocessing
  * Computing simple statistics of the raw reads 
  * Inspecting base quality scores of original reads (qc0)
  * Filtering and trimming poor reads. Phred Score = 25 or more (qctrim25: default)
  * Removing phiX contamination (qced)
  * Summarizing Base Call Phred scores graphically
```{}
bash ./code/01_1_ReadPreprocessDriver.bash
```

### Sequence Processing and OTU Preliminary Analysis
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
bash ./code/01_4_PhylotypeBasedTaxaDriver.bash
#bash ./code/01_5_ClusterBasedTaxaDriver.bash
#bash ./code/01_6_PhylogenyBasedTaxaDriver.bash
```

<br>

## Phase I: Remotely via job scheduling script (No docker image needed)
* Create a Portable Batch System (PBS) shell script. Typically, the PBS performs job scheduling and allocates the available computing resources. 

### Example Script for Multi Processor Job
* The **qsub** command scans the lines of the PBS script file for directives.  
* Important: Replace the parameters in the script to match your systems.
* [Useful sites](http://docs.adaptivecomputing.com/torque/4-0-2/Content/topics/commands/qsub.htm)

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


<!-- <br>
<br>
<hr>

## Phase II: In-depth Analysis and Visualization via Rstudio Environment
The output of phase I is visualized using integrated R functions and the entire analysis is summarized in a single HTML report using Rmarkdown.

<hr> -->
<br>
<br>


 


