
#!/usr/bin/env bash


##############################################################
## Download seqkit and put it into the code directory
# ```{}
# Mac version
wget --no-check-certificate https://github.com/shenwei356/seqkit/releases/download/v0.8.0/seqkit_darwin_amd64.tar.gz
tar -zxvf seqkit_darwin_amd64.tar.gz
mv seqkit code/
cp code/seqkit ~/bin/
rm seqkit_darwin_amd64.tar.gz

# ```

##############################################################
## Download fastqc and put it into the code directory
# ```{}

wget --no-check-certificate https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
unzip fastqc_v0.11.7.zip
chmod 755 FastQC/fastqc
mv -v FastQC code/
cp code/FastQC/fastqc ~/bin/
rm fastqc_v0.11.7.zip
# ```

##############################################################
# Install bbmap
# Note that this can sometimes be difficult to uncompress…..
# Refer: https://jgi.doe.gov/data-and-tools/bbtools/bb-tools-user-guide/installation-guide/

wget --no-check-certificate https://sourceforge.net/projects/bbmap/files/BBMap_37.90.tar.gz
tar -xvzf BBMap_37.90.tar.gz
mv -v bbmap code/
cp code/bbmap/bbduk.sh ~/bin/
rm BBMap_37.90.tar.gz


##############################################################
## Download latest mothur compartible to your platform and put it into the code directory
## Important: Latest versions may not work well until it is stable. Should that hapen, just install a previous version.

# # Mac
wget --no-check-certificate https://github.com/mothur/mothur/releases/download/v1.39.5/Mothur.mac_64.OSX-10.12.zip
unzip Mothur.mac_64.OSX-10.12.zip
mv mothur code/
cp code/mothur/mothur ~/bin/
cp code/mothur/uchime ~/bin/
cp code/mothur/vsearch ~/bin/
rm Mothur.mac_64.OSX-10.12.zip
rm -rf __MACOSX
