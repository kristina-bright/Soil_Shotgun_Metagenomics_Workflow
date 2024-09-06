#!/bin/bash

# Load GTDB-Tk module
module load gtdbtk

# Set directories
BASE_DIR="/work/soil/metagenome_001"
GTDBTK_DIR="${BASE_DIR}/05_Annotation/gtdb"
BINS_DIR="${BASE_DIR}/04_Binning/metabat2"

# Run GTDB-Tk for each sample
for sample in $(cat $BASE_DIR/samples.txt); do
    gtdbtk classify_wf --genome_dir $BINS_DIR/${sample}/bins_fasta -x fa --out_dir $GTDBTK_DIR/${sample}
done
