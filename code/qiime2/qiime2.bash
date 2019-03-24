# QIIME2 Pipeline for profiling microbial communities

## Activate qiime2 then confirm the version

source activate qiime2-2018.8
# qiime info

# ![](img/qiimeInfo.png)


## Inspect metadata

qiime tools inspect-metadata \
  data/metadata/samplemetadata.tsv

## Tabulate metadata in QIIME2 format

time qiime metadata tabulate \
  --m-input-file $PWD/data/metadata/samplemetadata.tsv \
  --o-visualization results/qzv/tabulated-sample-metadata.qzv

## Import demultiplexed PairedEnd Raw read data
time qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path $PWD/data/metadata/q2-manifest.txt \
  --output-path data/qiime2/demux.qza \
  --source-format PairedEndFastqManifestPhred33

## Summarize preliminary analysis
time qiime demux summarize \
  --i-data data/qiime2/demux.qza \
  --o-visualization results/qzv/results/qzv/demux.qzv

## Review the quality plots then pick truncate parameters

## Quality control using DADA2 
time qiime dada2 denoise-paired \
  --i-demultiplexed-seqs demux.qza \
  --p-trim-left-f 0 \
  --p-trunc-len-f 250 \
  --p-trim-left-r 0 \
  --p-trunc-len-r 250 \
  --o-representative-sequences rep-seqs.qza \
  --o-table feature-table.qza \
  --o-denoising-stats stats.qza

## View denoise statistics
time qiime metadata tabulate \
  --m-input-file stats.qza \
  --o-visualization results/qzv/stats.qzv

## View feature (sample & seqs) table
time qiime feature-table summarize \
  --i-table feature-table.qza \
  --o-visualization results/qzv/feature-table.qzv \
  --m-sample-metadata-file $PWD/data/metadata/samplemetadata.tsv

## View representative sequences
time qiime feature-table tabulate-seqs \
  --i-data rep-seqs.qza \
  --o-visualization results/qzv/rep-seqs.qzv

## Multiple alignment of representative sequences
time qiime alignment mafft \
  --i-sequences rep-seqs.qza \
  --o-alignment aligned-rep-seqs.qza

## Remove poor alignment
time qiime alignment mask \
  --i-alignment aligned-rep-seqs.qza \
  --o-masked-alignment masked-aligned-rep-seqs.qza

##  PHYLOGENETIC SEQUENCE CLUSTERING 

## Unrooted tree
time qiime phylogeny fasttree \
  --i-alignment masked-aligned-rep-seqs.qza \
  --o-tree unrooted-tree.qza

## Rooted tree
time qiime phylogeny midpoint-root \
  --i-tree unrooted-tree.qza \
  --o-rooted-tree rooted-tree.qza


## TAXONOMY ANALYSIS
### SILVA classifiation
time qiime feature-classifier classify-sklearn \
  --i-classifier classifiers/silva-132-99-nb-classifier.qza \
  --i-reads rep-seqs.qza \
  --o-classification silva-taxonomy.qza

### View SILVA Taxonomy classification
time qiime metadata tabulate \
  --m-input-file silva-taxonomy.qza \
  --o-visualization results/qzv/silva-taxonomy.qzv
  
### SILVA Barplots
time qiime taxa barplot \
  --i-table feature-table.qza \
  --i-taxonomy silva-taxonomy.qza \
  --m-metadata-file $PWD/data/metadata/samplemetadata.tsv \
  --o-visualization results/qzv/silva-taxa-bar-plots.qzv
  

## EXPORTED FILES: DATA TRANSFORMATION

time qiime tools export \
  --input-path feature-table.qza \
  --output-path exported-feature-table # Output feature-table.biom 

## CONVERT BIOM TO TSV

time biom convert \
  -i exported-feature-table/feature-table.biom \
  -o exported-feature-table/feature-table.tsv --to-tsv
  
time qiime tools export \
  --input-path silva-taxonomy.qza \
  --output-path exported-taxonomy-table # Output taxonomy.tsv

## COMBINE FEATURE TSV with TAXONOMY.TSV
time qiime metadata tabulate \
  --m-input-file exported-feature-table/feature-table.tsv \
  --m-input-file exported-taxonomy-table/taxonomy.tsv \
  --o-visualization results/qzv/exported-feature-table/feature-taxonomy-table.qzv


## Newick tree
time qiime tools export \
  --input-path rooted-tree.qza \
  --output-path exported-rooted-tree

time qiime tools export \
  --input-path unrooted-tree.qza \
  --output-path exported-unrooted-tree


# source deactivate

#```

