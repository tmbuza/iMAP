#!/usr/bin/env bash

bash ./code/dataanalysis/iMAP_dataanalysis_driver.bash

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, OTU anaysis did not finish, exiting...,!" 1>&2
    exit 1
fi


