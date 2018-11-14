
#!/usr/bin/env bash


##############################################################
## Download seqkit and put it into the code directory
# ```{}

# Linux version
# wget --no-check-certificate https://github.com/shenwei356/seqkit/releases/download/v0.8.0/seqkit_linux_amd64.tar.gz
# tar -zxvf seqkit_linux_amd64.tar.gz
# cp seqkit ~/bin/
# mv seqkit code/
# rm seqkit_linux_amd64.tar.gz

# Mac version
wget --no-check-certificate https://github.com/shenwei356/seqkit/releases/download/v0.8.0/seqkit_darwin_amd64.tar.gz
tar -zxvf seqkit_darwin_amd64.tar.gz
cp seqkit ~/bin/
mv seqkit code/
rm seqkit_darwin_amd64.tar.gz

# ```

# Windows version (Coming soon)


##############################################################
## Download fastqc and put it into the code directory
# ```{}

# Linux version
wget --no-check-certificate https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
unzip fastqc_v0.11.7.zip
chmod 755 FastQC/fastqc
mv -v FastQC code/
rm fastqc_v0.11.7.zip
# ```

# Mac version (Coming soon)

# Windows version (Coming soon)

##############################################################
# Install bbmap
# Note that this can sometimes be difficult to uncompress…..
# Refer: https://jgi.doe.gov/data-and-tools/bbtools/bb-tools-user-guide/installation-guide/

wget --no-check-certificate https://sourceforge.net/projects/bbmap/files/BBMap_37.90.tar.gz
tar -xvzf BBMap_37.90.tar.gz
mv -v bbmap code/
rm BBMap_37.90.tar.gz


##############################################################
## Download latest mothur compartible to your platform and put it into the code directory
#!Important: Latest versions may not work well until it is stable. Should that hapen, just install a previous version.

# #Linux
##wget --no-check-certificate https://github.com/mothur/mothur/releases/download/v1.40.0.1/Mothur.linux_64.zip
# wget --no-check-certificate https://github.com/mothur/mothur/releases/download/v1.39.5/Mothur.linux_64.zip
# unzip Mothur.linux_64.zip
# cp mothur/mothur ~/bin/
# mv mothur code/
# rm Mothur.linux_64.zip
# rm -rf __MACOSX

# # Mac
wget --no-check-certificate https://github.com/mothur/mothur/releases/download/v1.39.5/Mothur.mac_64.OSX-10.12.zip
unzip Mothur.mac_64.OSX-10.12.zip
cp mothur/mothur ~/bin/
cp mothur/uchime ~/bin/
cp mothur/vsearch ~/bin/
mv mothur code/
ln -s code/mothur/mothur ./mothur
rm Mothur.mac_64.OSX-10.12.zip
rm -rf __MACOSX
