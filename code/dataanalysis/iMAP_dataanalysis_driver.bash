
mothur code/dataanalysis/01_phylotype_analysis.batch


if [ "$?" != "0" ]; then
    echo "[Error] Sorry, phylotype-based analysis did not finish, exiting...,!" 1>&2
    exit 1
fi

mothur code/dataanalysis/02_otus_analysis.batch


if [ "$?" != "0" ]; then
   echo "[Error] Sorry, OTU-based analysis did not finish, exiting...,!" 1>&2
    exit 1
fi

mothur code/dataanalysis/03_phylogeny_analysis.batch


if [ "$?" != "0" ]; then
   echo "[Error] Sorry, phylogeny-based analysis did not finish, exiting...,!" 1>&2
    exit 1
fi
