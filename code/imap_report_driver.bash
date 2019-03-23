
## Metadata Profiling
bash ./code/progressreport1.bash
if [ "$?" != "0" ]; then
    echo "[Error] metadata profiling failed, please review!" 1>&2
    exit 1
fi


## QC report
bash ./code/progressreport2.bash
if [ "$?" != "0" ]; then
    echo "[Error] QC at preprocessing failed, please review!" 1>&2
    exit 1
fi


## Sequence preprocessing
bash ./code/progressreport3.bash
if [ "$?" != "0" ]; then
    echo "[Error] sequence preprocessing failed, please review!" 1>&2
    exit 1
fi


## Data transformation
bash ./code/datatransformation.bash
if [ "$?" != "0" ]; then
    echo "[Error] data transformation failed, please review!" 1>&2
    exit 1
fi


## Preliminary analysis
bash ./code/progressreport4.bash
if [ "$?" != "0" ]; then
    echo "[Error] preliminary analysis failed, please review!" 1>&2
    exit 1
fi
