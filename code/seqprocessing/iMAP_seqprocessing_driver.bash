mkdir data
mkdir data/references
mothur code/seqprocessing/01_assemble_paired_reads.batch

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, read assembly did not complete, exiting...!" 1>&2
    exit 1
fi

mothur code/seqprocessing/02_align_for_16S_consensus.batch

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, sequence alignment did not complete, exiting...!" 1>&2
    exit 1
fi

mothur code/seqprocessing/03_denoise_alignments.batch

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, denoising did not complete, exiting...!" 1>&2
    exit 1
fi

mothur code/seqprocessing/04_remove_chimeras.batch

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, chimera removal did not complete, exiting...!" 1>&2
    exit 1
fi
