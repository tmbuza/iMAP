mkdir data
mkdir data/references
mothur code/seqprocessing/01_assemble_paired_reads.batch
mothur code/seqprocessing/02_align_for_16S_consensus.batch
mothur code/seqprocessing/03_denoise_alignments.batch
mothur code/seqprocessing/04_remove_chimeras.batch

