mothur code/otutaxonomy/01_get_shared_phylotype.batch

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, the phylotype-based method did not finish, exiting...,!" 1>&2
    exit 1
fi


mothur code/otutaxonomy/04_processed_seqs.bash

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, the command failed, exiting...,!" 1>&2
    exit 1
fi


mothur code/dataanalysis/01_phylotype_analysis.batch

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, phylotype-based preliminary analysis did not finish, exiting...,!" 1>&2
    exit 1
fi
