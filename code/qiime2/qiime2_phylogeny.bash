# Phylogeny Analysis with QIIME2 Pipeline

## Activate qiime2 then confirm the version

```{}
cd qiime2
source activate qiime2-2018.8

## Using qced dataset
time qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path $PWD/manifest.txt \
  --output-path $PWD/demux.qza \
  --source-format PairedEndFastqManifestPhred33
time qiime demux summarize \
  --i-data demux.qza \
--o-visualization demux.qzv


time qiime dada2 denoise-paired \
  --i-demultiplexed-seqs demux.qza \
  --p-trim-left-f 0 \
  --p-trunc-len-f 250 \
  --p-trim-left-r 01 \
  --p-trunc-len-r 250 \
  --o-representative-sequences rep-seqs.qza \
  --o-table table.qza \
  --o-denoising-stats stats.qza

time qiime metadata tabulate \
  --m-input-file stats.qza \
  --o-visualization stats.qzv

time qiime feature-table summarize \
  --i-table table.qza \
  --o-visualization table.qzv \
  --m-sample-metadata-file sample-metadata.tsv

time qiime feature-table tabulate-seqs \
  --i-data rep-seqs.qza \
  --o-visualization rep-seqs.qzv

time qiime alignment mafft \
  --i-sequences rep-seqs.qza \
  --o-alignment aligned-rep-seqs.qza

time qiime alignment mask \
  --i-alignment aligned-rep-seqs.qza \
  --o-masked-alignment masked-aligned-rep-seqs.qza

time qiime phylogeny fasttree \
  --i-alignment masked-aligned-rep-seqs.qza \
  --o-tree unrooted-tree.qza

time qiime phylogeny midpoint-root \
  --i-tree unrooted-tree.qza \
  --o-rooted-tree rooted-tree.qza

time qiime tools export \
  unrooted-tree.qza \
  --output-dir unrooted-tree 

  
## Taxonomy analysis with SILVA 132
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

source deactivate

#```

