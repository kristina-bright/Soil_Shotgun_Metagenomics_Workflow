#!/bin/bash

# Navigate to the raw data directory
cd /work/soil/metagenome_001

# Create a directory for raw data
mkdir 00_raw
cd 00_raw

# Link the raw data
ln -s /work/soil/metagenome_001/01.RawData .

# Create a directory for FastQC output
mkdir -p 01_ReadQC/fastqc_pass1

# Run FastQC on all samples
for sample in $(cat samples.txt); do
  fastqc 01.RawData/${sample}/${sample}_*.fq.gz -o 01_ReadQC/fastqc_pass1 --threads 20
done
