# QIIME2 Pipeline

## Activate qiime2 then confirm the version

cd qiime2
source activate qiime2-2018.8
  
## Taxonomy analysis
### SILVA classifiation
time qiime feature-classifier classify-sklearn \
  --i-classifier /Volumes/SeagateTMB/pilotPAPER/qiimepilot/classifiers/silva-132-99-nb-classifier.qza \
  --i-reads rep-seqs.qza \
  --o-classification taxonomy.qza

### View SILVA Taxonomy classification
time qiime metadata tabulate \
  --m-input-file taxonomy.qza \
  --o-visualization taxonomy.qzv
  
### SILVA Barplots
qiime taxa barplot \
  --i-table table.qza \
  --i-taxonomy taxonomy.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization taxa-bar-plots.qzv
cd ..
source deactivate
#```

