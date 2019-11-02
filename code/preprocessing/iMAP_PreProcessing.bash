#!/usr/bin/env bash

## Read Preprocessing

### Simple Statistics for the unfiltered reads (qc0)
# ```{}

bash code/preprocessing/01_get_read_statistics.bash
if [ "$?" != "0" ]; then
    echo "[Error] Sorry, getting read statistics failed, please fix the problem and try again!" 1>&2
    exit 1
fi
# ```

### Inspect base quality scores of original reads
# ```{}

bash code/preprocessing/02_get_basecall_scores.bash
if [ "$?" != "0" ]; then
    echo "[Error] Sorry, the command for basecall scores did not complete, please fix the problem and try again!" 1>&2
    exit 1
fi
# ```

### Filter and trim poor reads. Phred Score = 25 or more (Default)
# ```{}

bash code/preprocessing/03_get_highscore_reads.bash
if [ "$?" != "0" ]; then
    echo "[Error] Sorry, removal of poor reads failed, please fix the problem and try again!" 1>&2
    exit 1
fi
# ```

## Remove phiX contamination
# ```{}

bash code/preprocessing/04_get_qced_reads.bash
if [ "$?" != "0" ]; then
    echo "[Error] Sorry, phiX removal did not complete sucessfuly, please fix the problem and try again!" 1>&2
    exit 1
fi
# ```


## Summarize Base Call Phred Scores using multiqc
# ```{}

bash code/preprocessing/05_fastqc_summary.bash
if [ "$?" != "0" ]; then
    echo "[Error] Sorry, MultiQC failed, please review and fix the problem,!" 1>&2
    exit 1
fi

# ```
