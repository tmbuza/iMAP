# iMAP: Integrated Microbiome Analysis Pipeline

NOTE: The new iMAP repository is undergoing reconstruction to enhance reproducibility. For further information, please consult the Related Work section below.

⚠️ WARNING: Certain sections (Parts) of iMAP are presently incomplete. We are actively engaged in data exploration, specifically emphasizing diverse visualization techniques. Additionally, we are expanding our scope to encompass statistical analysis and machine learning methodologies. Our team is dedicated to aiding users in uncovering insights and trends within microbiome datasets and developing data-driven hypotheses to facilitate well-informed decisions and actionable insights. Users are encouraged to revisit the site regularly for updates.

## Related Work


| IMAP-Repo                                      | Description                                               | GH-Pages                                             |
| :---------------------------------------------- | :--------------------------------------------------------- | :-----------------------------------------------------: |
| [OVERVIEW](https://github.com/tmbuza/imap-project-overview/) | IMAP project overview                                     | [Link](https://tmbuza.github.io/imap-project-overview/) |
| [PART 01](https://github.com/tmbuza/imap-essential-software/) | Software requirements for microbiome data analysis with Snakemake workflows | [Link](https://tmbuza.github.io/imap-essential-software/) |
| [PART 02](https://github.com/tmbuza/imap-sample-metadata/) | Downloading and exploring microbiome sample metadata from SRA Database | [Link](https://tmbuza.github.io/imap-sample-metadata/) |
| [PART 03](https://github.com/tmbuza/imap-download-sra-reads/) | Downloading and filtering microbiome sequencing data from SRA database | [Link](https://tmbuza.github.io/imap-download-sra-reads/) |
| [PART 04](https://github.com/tmbuza/imap-read-quality-control/) | Quality control of microbiome next-generation sequencing reads | [Link](https://tmbuza.github.io/imap-read-quality-control/) |
| [PART 05](https://github.com/tmbuza/imap-bioinformatics-mothur/) | Microbial profiling using MOTHUR and Snakemake workflows | [Link](https://tmbuza.github.io/imap-mothur-bioinformatics/) |
| [PART 06](https://github.com/tmbuza/imap-bioinformatics-qiime2/) | Microbial profiling using QIIME2 and Snakemake workflows | [Link](https://tmbuza.github.io/imap-qiime2-bioinformatics/) |
| [PART 07](https://github.com/tmbuza/imap-data-processing/) | Processing output from 16S-based microbiome bioinformatics pipelines | [Link](https://tmbuza.github.io/imap-data-preparation/) |
| [PART 08](https://github.com/tmbuza/imap-exploratory-analysis/) | Exploratory analysis of processed 16S-based microbiome data | [Link](https://tmbuza.github.io/imap-data-exploration/) |
| [PART 09](https://github.com/tmbuza/imap-statistical-analysis/) | Statistical analysis of processed 16S-based microbiome data | [Link](https://tmbuza.github.io/imap-statistical-analysis/) |
| [PART 10](https://github.com/tmbuza/imap-machine-learning/) | Machine learning analysis of processed 16S-based microbiome data | [Link](https://tmbuza.github.io/imap-machine-learning/) |



<br>

## Citation
> Please consider citing the [iMAP article](https://rdcu.be/b5iVj) (see below) if you find any part of the IMAP practical user guides helpful in your microbiome data analysis.

Buza, T. M., Tonui, T., Stomeo, F., Tiambo, C., Katani, R., Schilling, M., … Kapur, V. (2019). iMAP: An integrated bioinformatics and visualization pipeline for microbiome data analysis. BMC Bioinformatics, 20. https://doi.org/10.1186/S12859-019-2965-4

> Please, help to increase awareness of freely available microbiome data analysis tools.
Current [iMAP manuscript dimensions](https://badge.dimensions.ai/details/id/pub.1117740326)


<hr>


## Original iMAP!

### Running Analysis within Docker Container (Default)
* See this [Docker README](https://github.com/tmbuza/iMAP/blob/master/README0.md) for step-by-step instructions.
	* Requires Docker Images and Docker containers CLI.
	* Uses fewer resources, but memory-intensive computing may sometimes fail.
	* All analyses are run interactively on the container's Command-line.
	* The iMAP folder is, by default, the working directory and is readable from the container.
	* The output is stored in the working directory, which means it can be accessed outside the container.
* Important: Graphical applications don't work well in Docker containers. 
* Some R-packages installed perfectly in RStudio may not install correctly in docker images.


### Running Analysis On Specific Platforms
* See [Original README](https://github.com/tmbuza/iMAP/blob/master/_README.md) for step-by-step instructions.
* This README is a work in progress. Please visit this page regularly for more updates.
* No Docker images are required.
* May probably require manual installation of some tools.
* Uses RStudio to install required R-packages.

