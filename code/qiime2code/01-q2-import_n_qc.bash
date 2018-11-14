cd qiime2
source activate qiime2-2018.8

# # Batch1  
# time qiime tools import \
#   --type 'SampleData[PairedEndSequencesWithQuality]' \
#   --input-path $PWD/batch1-manifest.txt \
#   --output-path $PWD/batch1-demux.qza \
#   --source-format PairedEndFastqManifestPhred33
  
# time qiime demux summarize \
#   --i-data $PWD/batch1-demux.qza \
#   --o-visualization $PWD/batch1-demux.qzv
  
# # Batch2  
# time qiime tools import \
#   --type 'SampleData[PairedEndSequencesWithQuality]' \
#   --input-path $PWD/batch2-manifest.txt \
#   --output-path $PWD/batch2-demux.qza \
#   --source-format PairedEndFastqManifestPhred33
  
# time qiime demux summarize \
#   --i-data $PWD/batch2-demux.qza \
#   --o-visualization $PWD/batch2-demux.qzv
  
# # Batch3  
# time qiime tools import \
#   --type 'SampleData[PairedEndSequencesWithQuality]' \
#   --input-path $PWD/batch3-manifest.txt \
#   --output-path $PWD/batch3-demux.qza \
#   --source-format PairedEndFastqManifestPhred33
  
# time qiime demux summarize \
#   --i-data $PWD/batch3-demux.qza \
#   --o-visualization $PWD/batch3-demux.qzv
  
# # Batch4  
# time qiime tools import \
#   --type 'SampleData[PairedEndSequencesWithQuality]' \
#   --input-path $PWD/batch4-manifest.txt \
#   --output-path $PWD/batch4-demux.qza \
#   --source-format PairedEndFastqManifestPhred33
  
# time qiime demux summarize \
#   --i-data $PWD/batch4-demux.qza \
#   --o-visualization $PWD/batch4-demux.qzv
  
# # Batch5  
# time qiime tools import \
#   --type 'SampleData[PairedEndSequencesWithQuality]' \
#   --input-path $PWD/batch5-manifest.txt \
#   --output-path $PWD/batch5-demux.qza \
#   --source-format PairedEndFastqManifestPhred33
  
# time qiime demux summarize \
#   --i-data $PWD/batch5-demux.qza \
#   --o-visualization $PWD/batch5-demux.qzv
  
# # Batch6  
# time qiime tools import \
#   --type 'SampleData[PairedEndSequencesWithQuality]' \
#   --input-path $PWD/batch6-manifest.txt \
#   --output-path $PWD/batch6-demux.qza \
#   --source-format PairedEndFastqManifestPhred33
  
# time qiime demux summarize \
#   --i-data $PWD/batch6-demux.qza \
#   --o-visualization $PWD/batch6-demux.qzv
  
# # Batch7  
# time qiime tools import \
#   --type 'SampleData[PairedEndSequencesWithQuality]' \
#   --input-path $PWD/batch7-manifest.txt \
#   --output-path $PWD/batch7-demux.qza \
#   --source-format PairedEndFastqManifestPhred33
  
# time qiime demux summarize \
#   --i-data $PWD/batch7-demux.qza \
#   --o-visualization $PWD/batch7-demux.qzv
  
# # Batch8  
# time qiime tools import \
#   --type 'SampleData[PairedEndSequencesWithQuality]' \
#   --input-path $PWD/batch8-manifest.txt \
#   --output-path $PWD/batch8-demux.qza \
#   --source-format PairedEndFastqManifestPhred33
  
# time qiime demux summarize \
#   --i-data $PWD/batch8-demux.qza \
#   --o-visualization $PWD/batch8-demux.qzv

# # Batch12345 
# time qiime tools import \
#   --type 'SampleData[PairedEndSequencesWithQuality]' \
#   --input-path $PWD/batch12345-manifest.txt \
#   --output-path $PWD/batch12345-demux.qza \
#   --source-format PairedEndFastqManifestPhred33
  
# time qiime demux summarize \
#   --i-data $PWD/batch12345-demux.qza  \
#   --o-visualization $PWD/batch12345-demux.qzv

# # Batch12678
# time qiime tools import \
#   --type 'SampleData[PairedEndSequencesWithQuality]' \
#   --input-path $PWD/batch12678-manifest.txt \
#   --output-path $PWD/batch12678-demux.qza \
#   --source-format PairedEndFastqManifestPhred33
  
# time qiime demux summarize \
#   --i-data $PWD/batch12678-demux.qza  \
#   --o-visualization $PWD/batch12678-demux.qzv

# # Anthrax
# time qiime tools import \
#   --type 'SampleData[PairedEndSequencesWithQuality]' \
#   --input-path $PWD/anthrax-manifest.txt \
#   --output-path $PWD/anthrax-demux.qza \
#   --source-format PairedEndFastqManifestPhred33
  
# time qiime demux summarize \
#   --i-data $PWD/anthrax-demux.qza  \
#   --o-visualization $PWD/anthrax-demux.qzv

# # Murine
# cd qiime2
# source activate qiime2-2018.6
# time qiime tools import \
#   --type 'SampleData[PairedEndSequencesWithQuality]' \
#   --input-path $PWD/murine-qc0-manifest.txt \
#   --output-path $PWD/qc0-demux.qza \
#   --source-format PairedEndFastqManifestPhred33
# time qiime demux summarize \
#   --i-data qc0-demux.qza \
#   --o-visualization qc0-demux.qzv 
# time qiime tools import \
#   --type 'SampleData[PairedEndSequencesWithQuality]' \
#   --input-path $PWD/murine-qctrim25-manifest.txt \
#   --output-path $PWD/qctrim25-demux.qza \
#   --source-format PairedEndFastqManifestPhred33
# time qiime demux summarize \
#   --i-data qctrim25-demux.qza \
#   --o-visualization qctrim25-demux.qzv 
# # qced 
time qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path $PWD/murine-qced-manifest.txt \
  --output-path $PWD/qced-demux.qza \
  --source-format PairedEndFastqManifestPhred33
time qiime demux summarize \
  --i-data qced-demux.qza \
--o-visualization qced-demux.qzv
# #Subset  
# time qiime tools import \
#   --type 'SampleData[PairedEndSequencesWithQuality]' \
#   --input-path $PWD/murine-subset-manifest.txt \
#   --output-path $PWD/subset-demux.qza \
#   --source-format PairedEndFastqManifestPhred33
# time qiime demux summarize \
#   --i-data subset-demux.qza \
#   --o-visualization subset-demux.qzv
cd ..
source deactivate



