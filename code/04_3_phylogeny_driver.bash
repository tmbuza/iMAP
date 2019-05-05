mothur code/otutaxonomy/03_get_shared_phylogeny_taxonomy.batch

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, the phylogeny method did not finish, exiting...,!" 1>&2
    exit 1
fi
