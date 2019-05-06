wget -O ./iMAP/data/references/gg-13-8-99-nb-classifier.qza https://data.qiime2.org/2019.4/common/gg-13-8-99-nb-classifier.qza

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, download of qiime2 classifier failed, exiting...,!" 1>&2
    exit 1
fi
