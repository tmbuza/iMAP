# iMAP: Integrated Microbiome Analysis Pipeline

# Related work
> Here we show the IMAP Repos integrated with Snakemake and GitHub Actions!

| Repo | Description | Summary |
|-------------------------|---------------------------------------------------|-----------------|
| Repo | Description | Summary |
|-------------------------|---------------------------------------------------|-----------------|
| [IMAP-PART1](https://github.com/tmbuza/imap-requirements/) | Preparing for Microbiome Data Analysis | [GH-Pages](https://tmbuza.github.io/imap-requirements/) |
| [IMAP-PART2](https://github.com/tmbuza/imap-bioinformatics/) | Bioinformatics Analysis of Microbiome Data | [..In Progress..](https://tmbuza.github.io/imap-bioinformatics/) |
| [IMAP-PART3](https://github.com/tmbuza/imap-data-preprocessing/) | Microbiome Data Preprocessing | [..In Progress..](https://tmbuza.github.io/imap-data-preprocessing/) |
| [IMAP-PART4](https://github.com/tmbuza/imap-exploratory-analysis/) | Exploratory Analysis of Microbiome Data | [..In Progress..](https://tmbuza.github.io/imap-exploratory-analysis/) |
| [IMAP-PART5](https://tmbuza.github.io/imap-machine-learning/) | Microbiome Machine Learning | [..In Progress..](https://tmbuza.github.io/imap-machine-learning/) |


<br>

## Citation
> Please consider citing the [iMAP article](https://rdcu.be/b5iVj) (see below) if you find any part of the IMAP practical user guides helpful in your microbiome data analysis.

<br>

**APA-like citation style**

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

