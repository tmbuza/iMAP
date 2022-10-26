# iMAP: Integrated Microbiome Analysis Pipeline

Current [iMAP manuscript dimensions](https://badge.dimensions.ai/details/id/pub.1117740326)

## :tada: iMAP Parts!

|Repo| Description| Repo Output|
|-------------------------|---------------------------------------------------|-----------------|
| [iMAP-PART1](https://github.com/tmbuza/iMAP-part1/) | How to Get Started with Microbiome Data Analysis | [eBook](https://complexdatainsights.com/books/microbiome-analysis/getting-started) |
| [iMAP-PART2](https://github.com/tmbuza/iMAP-part2/) | Bioinformatics Analysis of Microbiome Data | [eBook](https://complexdatainsights.com/books/microbiome-analysis/bioinformatics-analysis) |
| [iMAP-PART3](https://github.com/tmbuza/iMAP-part3/) | Data Preprocessing | [eBook](https://complexdatainsights.com/books/microbiome-analysis/data-preprocessing) |
| [iMAP-PART4](https://github.com/tmbuza/iMAP-part4/) | Exploratory Analysis of Microbiome Data | [eBook](https://complexdatainsights.com/books/microbiome-analysis/exploratory-analysis) |


> The original pipeline is being restructured and updated with more improved workflows. The updated version will replace the existing pipeline. Please consider this an ongoing process of finding better and integrated solutions for microbiome data analysis.


## Citation
> Please consider citing the [iMAP article](https://rdcu.be/b5iVj) if you find any part of the iMAP practical user guides helpful in your analysis:

<i>Teresia M. Buza, Triza Tonui, Francesca Stomeo, Christian Tiambo, Robab Katani, Megan Schilling, Beatus Lyimo, Paul Gwakisa, Isabella M. Cattadori, Joram Buza and Vivek Kapur. iMAP: an integrated bioinformatics and visualization pipeline for microbiome data analysis. BMC Bioinformatics (2019) 20:374. [Free Full Text](https://pubmed.ncbi.nlm.nih.gov/31269897/)</i>.



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

