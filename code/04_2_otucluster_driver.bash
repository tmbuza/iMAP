mothur code/otutaxonomy/02_get_shared_otus.batch

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, the OTUcluster method did not finish, exiting...,!" 1>&2
    exit 1
fi


# mothur code/otutaxonomy/04_processed_seqs.bash

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, the command failed, exiting...,!" 1>&2
#     exit 1
# fi

mothur code/dataanalysis/02_otus_analysis.batch


if [ "$?" != "0" ]; then
   echo "[Error] Sorry, OTU-based preliminary analysis did not finish, exiting...,!" 1>&2
    exit 1
fi

mv mothur.*.logfile LOG

rm *.temp
