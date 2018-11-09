mkdir data
mkdir data/references
bash code/seqprocessing/00_add_pseudo_mock.bash
# bash code/seqprocessing/00_install_mothur.bash
./code/mothur/mothur code/seqprocessing/01_assemble_paired_reads.batch
# bash code/seqprocessing/02_download_ref_alignments.bash
./code/mothur/mothur code/seqprocessing/03_get_16S_consensus.batch
./code/mothur/mothur code/seqprocessing/04_perform_alignment_QC.batch
./code/mothur/mothur code/seqprocessing/05_remove_chimeras.batch

