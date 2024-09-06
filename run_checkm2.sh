#!/bin/bash

# Load modules
module load checkm2

# Set directories
BASE_DIR="/work/soil/metagenome_001"
CHECKM2_DIR="${BASE_DIR}/04_Binning/checkm2"

# Run CheckM2 for each sample
for sample in $(cat $BASE_DIR/samples.txt); do
    bins="${BASE_DIR}/04_Binning/metabat2/${sample}/bins_fasta"
    checkm2_output="${CHECKM2_DIR}/${sample}"

    checkm2 --input $bins --output $checkm2_output
done
