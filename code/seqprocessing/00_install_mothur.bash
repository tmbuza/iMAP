## Download latest mothur compartible to your platform and put it into the code directory
#!Important: Latest versions may not work well until it is stable. Should that hapen, just install a previous version.

# #Linux
##wget --no-check-certificate https://github.com/mothur/mothur/releases/download/v1.40.0.1/Mothur.linux_64.zip
wget --no-check-certificate https://github.com/mothur/mothur/releases/download/v1.39.5/Mothur.linux_64.zip
unzip Mothur.linux_64.zip
cp mothur/mothur ~/bin/
mv mothur code/
rm Mothur.linux_64.zip
rm -rf __MACOSX

# # Mac
# wget --no-check-certificate https://github.com/mothur/mothur/releases/download/v1.39.5/Mothur.mac_64.OSX-10.12.zip
# unzip Mothur.mac_64.OSX-10.12.zip
# cp mothur/mothur ~/bin/
# mv mothur code/
# rm Mothur.mac_64.OSX-10.12.zip
# rm -rf __MACOSX
