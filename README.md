# iMAP: Integrated Microbiome Analysis Pipeline

## Related work

| Repo | Description | Status |
|:-----------------------|----------------------------------|--------------:|
| [IMAP-PART 01](https://github.com/tmbuza/imap-software-requirements/) | Installing software to get started with microbiome data analysis with Snakemake workflows | [In-progress](https://tmbuza.github.io/imap-software-requirements/) |
| [IMAP-PART 02](https://github.com/tmbuza/imap-sample-metadata/) | How to download & explore microbiome sample metadata from NCBI-SRA Database | [In-progress](https://tmbuza.github.io/imap-sample-metadata/) |
| [IMAP-PART 03](https://github.com/tmbuza/imap-download-sra-reads/) | How to download microbiome sequencing reads from NCBI-SRA Database | [In-progress](https://tmbuza.github.io/imap-download-sra-reads/) |
| [IMAP-PART 04](https://github.com/tmbuza/imap-read-quality-control/) | Quality Control of Microbiome Next Generation Sequencing Reads | [In-progress](https://tmbuza.github.io/imap-read-quality-control/) |
| [IMAP-PART 05](https://github.com/tmbuza/imap-bioinformatics-analysis/) | Bioinformatics & classification of preprocessed microbiome sequencing data | [In-progress](https://tmbuza.github.io/imap-bioinformatics-analysis/) |
| [IMAP-PART 06](https://github.com/tmbuza//) |  | [In-progress](https://tmbuza.github.io//) |
| [IMAP-PART 07](https://github.com/tmbuza//) |  | [In-progress](https://tmbuza.github.io//) |
| [IMAP-PART 08](https://github.com/tmbuza//) |  | [In-progress](https://tmbuza.github.io//) |



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

