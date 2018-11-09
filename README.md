# iMAP: Pipeline for Microbiome Data Analysis and Exploratory Visualization

<br>

iMAP stands for **i**ntegrative **M**icrobiome **A**nalysis **P**ipeline. It is designed to run mostly on Command-Line-Interface (CLI) but can be ran in batch mode on PC or clusters as described in the guideline (this README).

# Guidelines for implementing iMAP pipeline

## Requirements

The first step is to gather all materials needed for implementing the iMAP pipeline smoothly (Table S1). 

<br>

Table: Table S1: List of required materials for running iMAP pipeline

| **Required**    | **Description**   |  **Folder** | **Remarks**          |
| :--------------------   | :-------------------------------------------------------------   |  :---------------: | :------------:   |
| **iMAP pipeline**       | Bundled scripts for comprehensive microbiome analysis            |  iMAP |[Link](https://github.com/tmbuza/iMAP.git)   |
| **Hardware**      | Computer with multi-core processor: preferably 64-bit.   |    |                |
|    | Remote Accessory Memory (RAM): 8 GB minimum.  |      ||
|    | Storage: Tens of gigabytes for small dataset otherwise a few terabytes  |      ||
| **Raw data**      | Demultiplexed reads in FASTQ format with primers, adapters and barcodes removed        |  data/references   |               |
| **Sample metadata**      | A tab-separated file showing sample identifiers, categorical and numeric variables        |  data/metadata        |          |
| **Mapping file**      | A file that links sample IDs (1st column) to the names of forward (2nd column) and reverse (3rd column) data files   |     |                    |
| **Design files**      | Files that assign samples to a specific variables or other categories   |     |                    |
| **Software**      |    |      ||
| *sekit*       | For inspecting rawdata format and simple statistics    |  code | [Link](https://github.com/shenwei356/seqkit/releases/)  |
| *FASTQc*      | For creating base call quality score images and statistics    |  code | [Link](https://www.bioinformatics.babraham.ac.uk/projects/FASTQc/)  |
| *bbmap_bbduk*      | For trimming poor quality reads    |  code | [Link](https://sourceforge.net/projects/bbmap/files/)  |
| *multiqc*      | For summarizing FASTQc output    |  |[Link](https://github.com/ewels/MultiQC.git)  |
| *Mothur*      | For sequence processing and classifying the sequences and preliminary analysis    |  code | [Link](https://github.com/Mothur/Mothur/releases/ ) |
| **Statistical an
