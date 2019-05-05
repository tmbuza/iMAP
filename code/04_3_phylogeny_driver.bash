mothur code/otutaxonomy/03_get_shared_phylogeny_taxonomy.batch

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, the phylogeny method did not finish, exiting...,!" 1>&2
    exit 1
fi



mothur code/otutaxonomy/04_processed_seqs.bash

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, the command failed, exiting...,!" 1>&2
    exit 1
fi


mothur code/dataanalysis/03_phylogeny_analysis.batch


if [ "$?" != "0" ]; then
   echo "[Error] Sorry, phylogeny-based  preliminary analysis did not finish, exiting...,!" 1>&2
    exit 1
fi
