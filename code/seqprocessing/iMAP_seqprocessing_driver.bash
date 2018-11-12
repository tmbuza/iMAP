mkdir data
mkdir data/references
bash code/seqprocessing/00_add_pseudo_mock.bash
./code/mothur/mothur code/seqprocessing/01_assemble_paired_reads.batch
./code/mothur/mothur code/seqprocessing/02_get_16S_consensus.batch
./code/mothur/mothur code/seqprocessing/03_perform_alignment_QC.batch
./code/mothur/mothur code/seqprocessing/04_remove_chimeras.batch

