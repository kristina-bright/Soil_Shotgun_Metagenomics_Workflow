#!/bin/bash

# Load modules if necessary
module load singularity

# Set directories
DATA_DIR="/work/soil/metagenome_001"
ASSEMBLY_DIR="${DATA_DIR}/02_Assembly/megahit"
QUAST_DIR="${DATA_DIR}/02_Assembly/quast"

# Create output directory
mkdir -p $QUAST_DIR

# Run QUAST on all samples
for sample in $(cat $DATA_DIR/samples.txt); do
    singularity exec quast.sif quast.py \
    -o $QUAST_DIR/${sample} \
    $ASSEMBLY_DIR/${sample}/final.contigs.fa
done
