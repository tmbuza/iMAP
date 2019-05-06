# QIIME2 Pipeline for profiling microbial communities

## Inspect metadata

mkdir data/qiime2
mkdir results/qzv

qiime tools inspect-metadata \
  $PWD/data/metadata/samplemetadata.tsv 

## Tabulate metadata in QIIME2 format

qiime metadata tabulate \
  --m-input-file $PWD/data/metadata/samplemetadata.tsv \
  --o-visualization results/qzv/tabulated-sample-metadata.qzv

## Import demultiplexed PairedEnd Raw read data

qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path $PWD/data/metadata/manifest.txt \
  --output-path $PWD/data/qiime2/demux.qza \
  --input-format PairedEndFastqManifestPhred33

# qiime tools import \
#   --input-path $PWD/data/mothur/qced.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.fasta \
#   --output-path $PWD/data/qiime2/aligned-sequences.qza \
#   --type 'FeatureData[AlignedSequence]'



## Summarize preliminary analysis
qiime demux summarize \
  --i-data $PWD/data/qiime2/demux.qza \
  --o-visualization $PWD/results/qzv/demux.qzv

# ## Review the quality plots then pick truncate parameters

# ## Quality control using DADA2 
time qiime dada2 denoise-paired \
  --i-demultiplexed-seqs $PWD/data/qiime2/demux.qza \
  --p-trim-left-f 0 \
  --p-trunc-len-f 0 \
  --p-trim-left-r 0 \
  --p-trunc-len-r 0 \
  --o-representative-sequences $PWD/data/qiime2/rep-seqs.qza \
  --o-table $PWD/data/qiime2/feature-table.qza \
  --o-denoising-stats $PWD/data/qiime2/stats.qza

## View denoise statistics
qiime metadata tabulate \
  --m-input-file $PWD/data/qiime2/stats.qza \
  --o-visualization $PWD/results/qzv/stats.qzv

## View feature (sample & seqs) table
qiime feature-table summarize \
  --i-table $PWD/data/qiime2/feature-table.qza \
  --o-visualization $PWD/results/qzv/feature-table.qzv \
  --m-sample-metadata-file $PWD/data/metadata/samplemetadata.tsv

## View representative sequences
qiime feature-table tabulate-seqs \
  --i-data $PWD/data/qiime2/rep-seqs.qza \
  --o-visualization $PWD/results/qzv/rep-seqs.qzv

## Multiple alignment of representative sequences
qiime alignment mafft \
  --i-sequences $PWD/data/qiime2/rep-seqs.qza \
  --o-alignment $PWD/data/qiime2/aligned-rep-seqs.qza

## Remove poor alignment
qiime alignment mask \
  --i-alignment $PWD/data/qiime2/aligned-rep-seqs.qza \
  --o-masked-alignment $PWD/data/qiime2/masked-aligned-rep-seqs.qza

##  PHYLOGENETIC SEQUENCE CLUSTERING 

## Unrooted tree
qiime phylogeny fasttree \
  --i-alignment $PWD/data/qiime2/masked-aligned-rep-seqs.qza \
  --o-tree $PWD/data/qiime2/unrooted-tree.qza

## Rooted tree
qiime phylogeny midpoint-root \
  --i-tree $PWD/data/qiime2/unrooted-tree.qza \
  --o-rooted-tree $PWD/data/qiime2/rooted-tree.qza


## TAXONOMY ANALYSIS
### Greengenes classifiation
time qiime feature-classifier classify-sklearn \
 ## --i-classifier $PWD/data/references/gg-13-8-99-nb-classifier.qza \
  --i-classifier $PWD/data/references/gg-13-8-99-515-806-nb-classifier.qza \
  --i-reads $PWD/data/qiime2/rep-seqs.qza \
  --o-classification $PWD/data/qiime2/greengenes-taxonomy.qza

### View greengenes Taxonomy classification
qiime metadata tabulate \
  --m-input-file $PWD/data/qiime2/greengenes-taxonomy.qza \
  --o-visualization $PWD/results/qzv/greengenes-taxonomy.qzv
  
### Greengenes Barplots
qiime taxa barplot \
  --i-table $PWD/data/qiime2/feature-table.qza \
  --i-taxonomy $PWD/data/qiime2/greengenes-taxonomy.qza \
  --m-metadata-file $PWD/data/metadata/samplemetadata.tsv \
  --o-visualization $PWD/results/qzv/greengenes-taxa-bar-plots.qzv
  

## EXPORTED FILES: DATA TRANSFORMATION

qiime tools export \
  --input-path $PWD/data/qiime2/feature-table.qza \
  --output-path $PWD/results/qzv/exported-feature-table # Output feature-table.biom 

## CONVERT BIOM TO TSV
  
biom convert \
  -i $PWD/results/qzv/exported-feature-table/feature-table.biom \
  -o $PWD/results/qzv/exported-feature-table/feature-table.tsv --to-tsv
  
qiime tools export \
  --input-path $PWD/data/qiime2/greengenes-taxonomy.qza \
  --output-path $PWD/results/qzv/exported-taxonomy-table # Output taxonomy.tsv

## COMBINE FEATURE TSV with TAXONOMY.TSV
qiime metadata tabulate \
  --m-input-file $PWD/results/qzv/exported-feature-table/feature-table.tsv \
  --m-input-file $PWD/results/qzv/exported-taxonomy-table/taxonomy.tsv \
  --o-visualization $PWD/results/qzv/exported-feature-table/feature-taxonomy-table.qzv


## Newick tree
qiime tools export \
  --input-path $PWD/data/qiime2/rooted-tree.qza \
  --output-path $PWD/results/qzv/exported-rooted-tree

qiime tools export \
  --input-path $PWD/data/qiime2/unrooted-tree.qza \
  --output-path $PWD/results/qzv/exported-unrooted-tree




