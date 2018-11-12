#!/bin/bash

# Program: 01_inspect.sh

# Purpose: Quality control

# Created by: TMB
# Last revised: 2017-06-27

# Copyright 2017 Bioinformatics Consulting Center and the Penn State University. All rights reserved.


# Usage: 

# Setting timestamp variables
DATE=`date +%Y-%m-%d`
TIME=`date +%H:%M`
DT=`date +%Y%m%d-%H%M`

# Create results directory
mkdir ./results/


# Create log file
LOG=./results/imappaper_$DT.log

echo ""
echo ""

clear

START=`date +%s`

echo "Analysis started:" 
date +%Y-%m-%d_%H:%M

#------------------------------
git clone https://github.com/tmbuza/iMAP.git
cd iMAP
bash ./code/windows_iMAP_driver.bash

#------------------------------

echo ""
echo "Analysis ended:"
date +%Y-%m-%d_%H:%M

echo ""

END=`date +%s`

RUNTIME=$(( END - START ))

RUNTIME_minutes=$((RUNTIME/60))

RUNTIME_hour=$((RUNTIME/3600))

echo "Summary report"

echo ""
echo "Time taken to complete this task"
echo "$RUNTIME seconds"
echo "$RUNTIME_minutes minutes"
echo "$RUNTIME_hour hours"

echo ""
echo ""
# =======================================================


