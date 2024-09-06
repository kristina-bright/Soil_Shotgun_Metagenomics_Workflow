#!/bin/bash

# Load modules
module load metabat2

# Set directories
BASE_DIR="/work/soil/metagenome_001"
BINNING_DIR="${BASE_DIR}/04_Binning/metabat2"

# Create output directory
mkdir -p $BINNING_DIR

# Run Metabat2 for each sample
for sample in $(cat $BASE_DIR/samples.txt); do
    sorted_bam="$BASE_DIR/03_Mapping/${sample}.sorted.bam"
    contigs="$BASE_DIR/02_Assembly/megahit/${sample}/final.contigs.fa"
    depth_file="${BINNING_DIR}/${sample}_depth.txt"

    jgi_summarize_bam_contig_depths --outputDepth $depth_file $sorted_bam
    metabat2 -i $contigs -a $depth_file -o ${BINNING_DIR}/${sample}
done
