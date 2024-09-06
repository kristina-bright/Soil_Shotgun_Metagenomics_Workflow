#!/bin/bash

# Load necessary modules
module load samtools

# Set base directory
BASE_DIR="/work/soil/metagenome_001"

# Activate the conda environment
conda activate strobealign

# Run strobealign for each sample
for sample in $(cat $BASE_DIR/samples.txt); do
    forward_reads="$BASE_DIR/01.RawData/${sample}_1.fq.gz"
    reverse_reads="$BASE_DIR/01.RawData/${sample}_2.fq.gz"
    contigs="$BASE_DIR/02_Assembly/megahit/${sample}/final.contigs.fa"
    bam_output="$BASE_DIR/03_Mapping/${sample}.sorted.bam"

    strobealign $contigs $forward_reads $reverse_reads | samtools sort -o $bam_output
    samtools index $bam_output
done
