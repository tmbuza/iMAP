# QIIME2 Pipeline

## Activate qiime2 then confirm the version

cd qiime2
source activate qiime2-2018.6


## Alpha diversity: Rarefaction
time qiime diversity alpha-rarefaction \
  --i-table table.qza \
  --i-phylogeny rooted-tree.qza \
  --p-max-depth 100 \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization alpha-rarefaction.qzv

## Alpha phylogeny diversity: Core metrics and phylogenetic
time qiime diversity core-metrics-phylogenetic \
  --i-phylogeny rooted-tree.qza \
  --i-table table.qza \
  --p-sampling-depth 100 \
  --m-metadata-file sample-metadata.tsv \
  --output-dir core-metrics-results

## Statistical analysis

### Alpha diversity: Evenness 
time qiime diversity alpha-group-significance \
  --i-alpha-diversity core-metrics-results/evenness_vector.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization core-metrics-results/evenness-group-significance.qzv
  
### Alpha diversity: Faith phylogenetic diversity
time qiime diversity alpha-group-significance \
  --i-alpha-diversity core-metrics-results/faith_pd_vector.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization core-metrics-results/faith-pd-group-significance.qzv

## Beta diversity

### PERMANOVA on Sex
time qiime diversity beta-group-significance \
  --i-distance-matrix core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file sample-metadata.tsv \
  --m-metadata-column Sex \
  --o-visualization core-metrics-results/unweighted-unifrac-Sex-significance.qzv \
  --p-pairwise

### PERMANOVA on Time
time qiime diversity beta-group-significance \
  --i-distance-matrix core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file sample-metadata.tsv \
  --m-metadata-column Time \
  --o-visualization core-metrics-results/unweighted-unifrac-Time-significance.qzv \
  --p-pairwise
  
### ANOSIM on Sex
time qiime diversity beta-group-significance \
  --i-distance-matrix core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file sample-metadata.tsv \
  --m-metadata-column Sex \
  --o-visualization core-metrics-results/unweighted-unifrac-Sex-anosim-significance.qzv \
  --p-method anosim
  
### ANOSIM on Time
time qiime diversity beta-group-significance \
  --i-distance-matrix core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file sample-metadata.tsv \
  --m-metadata-column Time \
  --o-visualization core-metrics-results/unweighted-unifrac-Time-anosim-significance.qzv \
  --p-method anosim
  
## Distance metrics ordination using Emperor
time qiime emperor plot \
  --i-pcoa core-metrics-results/unweighted_unifrac_pcoa_results.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization core-metrics-results/unweighted-unifrac-emperor.qzv

time qiime emperor plot \
  --i-pcoa core-metrics-results/weighted_unifrac_pcoa_results.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization core-metrics-results/weighted-unifrac-emperor.qzv

time qiime emperor plot \
  --i-pcoa core-metrics-results/bray_curtis_pcoa_results.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization core-metrics-results/bray-curtis-emperor.qzv

time qiime emperor plot \
  --i-pcoa core-metrics-results/jaccard_pcoa_results.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization core-metrics-results/jaccard-emperor.qzv
  
## Taxonomy analysis
### Greengenes classification
time qiime feature-classifier classify-sklearn \
  --i-classifier /Volumes/SeagateTMB/pilotPAPER/qiimepilot/classifiers/gg-13-8-99-515-806-nb-classifier.qza \
  --i-reads rep-seqs.qza \
  --o-classification gg-taxonomy.qza

### View Greengenes Taxonomy classification
time qiime metadata tabulate \
  --m-input-file gg-taxonomy.qza \
  --o-visualization gg-taxonomy.qzv
  
### Greengenes Barplots
qiime taxa barplot \
  --i-table table.qza \
  --i-taxonomy gg-taxonomy.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization gg-taxa-bar-plots.qzv

### SILVA classifiation
time qiime feature-classifier classify-sklearn \
  --i-classifier /Volumes/SeagateTMB/pilotPAPER/qiimepilot/classifiers/silva-132-99-nb-classifier.qza \
  --i-reads rep-seqs.qza \
  --o-classification silva-taxonomy.qza

### View SILVA Taxonomy classification
time qiime metadata tabulate \
  --m-input-file silva-taxonomy.qza \
  --o-visualization silva-taxonomy.qzv
  
### SILVA Barplots
qiime taxa barplot \
  --i-table table.qza \
  --i-taxonomy silva-taxonomy.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization silva-taxa-bar-plots.qzv
cd ..
source deactivate
#```

