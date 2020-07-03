wget -O ./iMAP/data/references/gg-13-8-99-515-806-nb-classifier.qza https://data.qiime2.org/2020.2/common/gg-13-8-99-515-806-nb-classifier.qza
                                                                    
if [ "$?" != "0" ]; then
    echo "[Error] Sorry, download failed, exiting...,!" 1>&2
    exit 1
fi
# wget -O "./data/references/gg-13-8-99-nb-classifier.qza" "https://data.qiime2.org/2019.4/common/gg-13-8-99-nb-classifier.qza")
