mothur code/otutaxonomy/02_get_shared_otus.batch

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, the OTUcluster method did not finish, exiting...,!" 1>&2
    exit 1
fi

