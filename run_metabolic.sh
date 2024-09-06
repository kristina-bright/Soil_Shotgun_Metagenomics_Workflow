#!/bin/bash

# Load METABOLIC module
conda activate METABOLIC_v4.0

# Set directories
BASE_DIR="/work/soil/metagenome_001"
METABOLIC_DIR="${BASE_DIR}/05_Annotation/metabolic"

# Run METABOLIC for each sample
for sample in $(cat $BASE_DIR/samples.txt); do
    metabolic_output="${METABOLIC_DIR}/${sample}"

    perl METABOLIC-G.pl -in $BASE_DIR/04_Binning/checkm2/${sample}/protein_files -o $metabolic_output
done
