#!/bin/bash

# Load CoverM module
module load coverm

# Set directories
BASE_DIR="/work/soil/metagenome_001"
COVERM_DIR="${BASE_DIR}/06_Representative_MAGs/coverm"

# Run CoverM for each sample
for sample in $(cat $BASE_DIR/samples.txt); do
    forward_reads="$BASE_DIR/01.RawData/${sample}_1.fq.gz"
    reverse_reads="$BASE_DIR/01.RawData/${sample}_2.fq.gz"
    genome_dir="${BASE_DIR}/06_Representative_MAGs/drep_out/dereplicated_genomes"

    coverm genome -1 $forward_reads -2 $reverse_reads --genome-fasta-files $(ls $genome_dir/*.fa) -o $COVERM_DIR/${sample}.coverm_output.tsv
done
