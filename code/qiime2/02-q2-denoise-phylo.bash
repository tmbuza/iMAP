cd qiime2
source activate qiime2-2018.6

time qiime dada2 denoise-paired \
  --i-demultiplexed-seqs qced-demux.qza \
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
  --m-sample-metadata-file murine-sample-metadata.tsv

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

cd ..
source deactivate
  
