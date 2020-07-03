# QIIME2 Pipeline for profiling microbial communities

## Inspect metadata

mkdir data/qiime2
mkdir data/qiime2/results

qiime tools inspect-metadata \
  $PWD/data/metadata/samplemetadata.tsv 

## Tabulate metadata in QIIME2 format

qiime metadata tabulate \
  --m-input-file $PWD/data/metadata/samplemetadata.tsv \
  --o-visualization $PWD/data/qiime2/results/tabulated-sample-metadata.qzv

## Import demultiplexed PairedEnd Raw read data

qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path $PWD/data/metadata/manifest.txt \
  --output-path $PWD/data/qiime2/results/demux.qza \
  --input-format PairedEndFastqManifestPhred33

# qiime tools import \
#   --input-path $PWD/data/mothur/qced.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.fasta \
#   --output-path $PWD/data/qiime2/results/aligned-sequences.qza \
#   --type 'FeatureData[AlignedSequence]'

## Summarize preliminary analysis
time qiime demux summarize \
  --i-data $PWD/data/qiime2/results/demux.qza \
  --o-visualization $PWD/data/qiime2/results/demux.qzv

# ## Review the quality plots then pick truncate parameters

# ## Quality control using DADA2 
time qiime dada2 denoise-paired \
  --i-demultiplexed-seqs $PWD/data/qiime2/results/demux.qza \
  --p-trim-left-f 0 \
  --p-trunc-len-f 0 \
  --p-trim-left-r 0 \
  --p-trunc-len-r 0 \
  --o-representative-sequences $PWD/data/qiime2/results/rep-seqs.qza \
  --o-table $PWD/data/qiime2/results/feature-table.qza \
  --o-denoising-stats $PWD/data/qiime2/results/stats.qza

## View denoise statistics
qiime metadata tabulate \
  --m-input-file $PWD/data/qiime2/results/stats.qza \
  --o-visualization $PWD/data/qiime2/results/stats.qzv

## View feature (sample & seqs) table
qiime feature-table summarize \
  --i-table $PWD/data/qiime2/results/feature-table.qza \
  --o-visualization $PWD/data/qiime2/results/feature-table.qzv \
  --m-sample-metadata-file $PWD/data/metadata/samplemetadata.tsv

## View representative sequences
qiime feature-table tabulate-seqs \
  --i-data $PWD/data/qiime2/results/rep-seqs.qza \
  --o-visualization $PWD/data/qiime2/results/rep-seqs.qzv

## Multiple alignment of representative sequences
qiime alignment mafft \
  --i-sequences $PWD/data/qiime2/results/rep-seqs.qza \
  --o-alignment $PWD/data/qiime2/results/aligned-rep-seqs.qza

## Remove poor alignment
qiime alignment mask \
  --i-alignment $PWD/data/qiime2/results/aligned-rep-seqs.qza \
  --o-masked-alignment $PWD/data/qiime2/results/masked-aligned-rep-seqs.qza

##  PHYLOGENETIC SEQUENCE CLUSTERING 

## Unrooted tree
qiime phylogeny fasttree \
  --i-alignment $PWD/data/qiime2/results/masked-aligned-rep-seqs.qza \
  --o-tree $PWD/data/qiime2/results/unrooted-tree.qza

## Rooted tree
qiime phylogeny midpoint-root \
  --i-tree $PWD/data/qiime2/results/unrooted-tree.qza \
  --o-rooted-tree $PWD/data/qiime2/results/rooted-tree.qza

## Alpha diversity: Rarefaction
time qiime diversity alpha-rarefaction \
  --i-table $PWD/data/qiime2/results/feature-table.qza \
  --i-phylogeny $PWD/data/qiime2/results/rooted-tree.qza \
  --p-max-depth 9000 \
  --m-metadata-file $PWD/data/metadata/samplemetadata.tsv \
  --o-visualization $PWD/data/qiime2/results/alpha-rarefaction.qzv

## Alpha phylogeny diversity: Core metrics and phylogenetic
time qiime diversity core-metrics-phylogenetic \
  --i-table $PWD/data/qiime2/results/feature-table.qza \
  --i-phylogeny $PWD/data/qiime2/results/rooted-tree.qza \
  --p-sampling-depth 2000 \
  --m-metadata-file $PWD/data/metadata/samplemetadata.tsv \
  --output-dir $PWD/data/qiime2/results/core-metrics-results

## Statistical analysis
### Alpha diversity: Evenness
time qiime diversity alpha-group-significance \
  --i-alpha-diversity $PWD/data/qiime2/results/core-metrics-results/evenness_vector.qza \
  --m-metadata-file $PWD/data/metadata/samplemetadata.tsv \
  --o-visualization $PWD/data/qiime2/results/core-metrics-results/evenness-group-significance.qzv
  
### Alpha diversity: Faith phylogenetic diversity
time qiime diversity alpha-group-significance \
  --i-alpha-diversity $PWD/data/qiime2/results/core-metrics-results/faith_pd_vector.qza \
  --m-metadata-file $PWD/data/metadata/samplemetadata.tsv \
  --o-visualization $PWD/data/qiime2/results/core-metrics-results/faith-pd-group-significance.qzv
  
## Beta diversity
### PERMANOVA on Variable 1
time qiime diversity beta-group-significance \
  --i-distance-matrix $PWD/data/qiime2/results/core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file $PWD/data/metadata/samplemetadata.tsv \
  --m-metadata-column Var1 \
  --o-visualization $PWD/data/qiime2/results/core-metrics-results/unweighted-unifrac-Var1-significance.qzv \
  --p-pairwise

### PERMANOVA on Variable 2
time qiime diversity beta-group-significance \
  --i-distance-matrix $PWD/data/qiime2/results/core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file $PWD/data/metadata/samplemetadata.tsv \
  --m-metadata-column Var2 \
  --o-visualization $PWD/data/qiime2/results/core-metrics-results/unweighted-unifrac-Var2-significance.qzv \
  --p-pairwise

### ANOSIM on Variable 1
time qiime diversity beta-group-significance \
  --i-distance-matrix $PWD/data/qiime2/results/core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file $PWD/data/metadata/samplemetadata.tsv \
  --m-metadata-column Var1 \
  --o-visualization $PWD/data/qiime2/results/core-metrics-results/unweighted-unifrac-anosim-Var1-significance.qzv \
  --p-method anosim

### ANOSIM on Variable 2
time qiime diversity beta-group-significance \
  --i-distance-matrix $PWD/data/qiime2/results/core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file $PWD/data/metadata/samplemetadata.tsv \
  --m-metadata-column Var2 \
  --o-visualization $PWD/data/qiime2/results/core-metrics-results/unweighted-unifrac-anosim-Var2-significance.qzv \
  --p-method anosim

## Ordination: Distance metrics using Emperor

### Unweighted-unifrac
time qiime emperor plot \
  --i-pcoa $PWD/data/qiime2/results/core-metrics-results/unweighted_unifrac_pcoa_results.qza \
  --m-metadata-file $PWD/data/metadata/samplemetadata.tsv \
  --o-visualization $PWD/data/qiime2/results/core-metrics-results/unweighted-unifrac-emperor.qzv

### Weighted-unifrac
time qiime emperor plot \
  --i-pcoa $PWD/data/qiime2/results/core-metrics-results/weighted_unifrac_pcoa_results.qza \
  --m-metadata-file $PWD/data/metadata/samplemetadata.tsv \
  --o-visualization $PWD/data/qiime2/results/core-metrics-results/weighted-unifrac-emperor.qzv

### Bray-curtis PCoA
time qiime emperor plot \
  --i-pcoa $PWD/data/qiime2/results/core-metrics-results/bray_curtis_pcoa_results.qza \
  --m-metadata-file $PWD/data/metadata/samplemetadata.tsv \
  --o-visualization $PWD/data/qiime2/results/core-metrics-results/bray-curtis-emperor.qzv

### Jaccard PCoA
time qiime emperor plot \
  --i-pcoa $PWD/data/qiime2/results/core-metrics-results/jaccard_pcoa_results.qza \
  --m-metadata-file $PWD/data/metadata/samplemetadata.tsv \
  --o-visualization $PWD/data/qiime2/results/core-metrics-results/jaccard-emperor.qzv
  



## TAXONOMY ANALYSIS
### Classifier

time qiime feature-classifier classify-sklearn \
  # --i-classifier $PWD/data/references/gg-13-8-99-515-806-nb-classifier.qza \
  --i-classifier $PWD/data/references/silva-132-99-515-806-nb-classifier.qza \
  --i-reads $PWD/data/qiime2/results/rep-seqs.qza \
  --o-classification $PWD/data/qiime2/results/taxonomy.qza

### View Taxonomy classification
qiime metadata tabulate \
  --m-input-file $PWD/data/qiime2/results/taxonomy.qza \
  --o-visualization $PWD/data/qiime2/results/taxonomy.qzv
  
### Barplots
qiime taxa barplot \
  --i-table $PWD/data/qiime2/results/feature-table.qza \
  --i-taxonomy $PWD/data/qiime2/results/taxonomy.qza \
  --m-metadata-file $PWD/data/metadata/samplemetadata.tsv \
  --o-visualization $PWD/data/qiime2/results/taxa-bar-plots.qzv
  

## EXPORTED FILES: DATA TRANSFORMATION

qiime tools export \
  --input-path $PWD/data/qiime2/results/feature-table.qza \
  --output-path $PWD/data/qiime2/results/exported-feature-table # Output feature-table.biom 

## CONVERT BIOM TO TSV
  
biom convert \
  -i $PWD/data/qiime2/results/exported-feature-table/feature-table.biom \
  -o $PWD/data/qiime2/results/exported-feature-table/feature-table.tsv --to-tsv
  
qiime tools export \
  --input-path $PWD/data/qiime2/results/taxonomy.qza \
  --output-path $PWD/data/qiime2/results/exported-taxonomy-table # Output taxonomy.tsv

## COMBINE FEATURE TSV with TAXONOMY.TSV
qiime metadata tabulate \
  --m-input-file $PWD/data/qiime2/results/exported-feature-table/feature-table.tsv \
  --m-input-file $PWD/data/qiime2/results/exported-taxonomy-table/taxonomy.tsv \
  --o-visualization $PWD/data/qiime2/results/exported-feature-table/feature-taxonomy-table.qzv


## Newick tree
qiime tools export \
  --input-path $PWD/data/qiime2/results/rooted-tree.qza \
  --output-path $PWD/data/qiime2/results/exported-rooted-tree

qiime tools export \
  --input-path $PWD/data/qiime2/results/unrooted-tree.qza \
  --output-path $PWD/data/qiime2/results/exported-unrooted-tree




