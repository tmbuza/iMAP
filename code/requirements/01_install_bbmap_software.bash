#!/usr/bin/env bash

# wget --no-check-certificate https://sourceforge.net/projects/bbmap/files/BBMap_37.90.tar.gz
# tar -xvzf BBMap_37.90.tar.gz
# mv -v bbmap /imap/code/
# rm BBMap_37.90.tar.gz

unzip -o iMAP/resources/bbmap.zip -d code

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, the bbmap tool is required, please make sure that it is installed properly. !" 1>&2
    exit 1
fi
