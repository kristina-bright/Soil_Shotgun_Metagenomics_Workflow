# Soil_Shotgun_Metagenomics_Workflow

This repository contains the workflow and scripts for analyzing alpine soil shotgun metagenomics data on a high-performance computing (HPC) cluster. The workflow includes data download, quality control, assembly, and downstream analysis.

## Workflow Overview

1. **Data Download**: 
   - `download_data.sh`: This script downloads the raw metagenomic data from the specified source to the working directory on the HPC cluster.

2. **Quality Control**:
   - `run_fastqc.sh`: Runs FastQC to perform quality control checks on the raw sequence data.

3. **Assembly**:
   - `run_megahit.sh`: Uses MEGAHIT to assemble the quality-controlled reads into contigs.
   - `run_quast.sh`: Assesses the quality of the assembled contigs using QUAST.

4. **Mapping**:
   - `run_strobealign.sh`: Maps reads back to the assembled contigs to evaluate coverage and alignment using Strobealign.

5. **Binning**:
   - `run_metabat2.sh`: Bins contigs into putative genomes using Metabat2.
   - `run_checkm2.sh`: Evaluates the quality of the binned genomes using CheckM2.

6. **Annotation**:
   - `run_gtdbtk.sh`: Assigns taxonomy to the binned genomes using GTDB-Tk.
   - `run_metabolic.sh`: Annotates metabolic pathways in the binned genomes using METABOLIC.

7. **Dereplication**:
   - `run_drep.sh`: Dereplicates the binned genomes to identify unique representative genomes using dRep.

8. **Relative Abundance**:
   - `run_coverm.sh`: Calculates the relative abundance of the genomes across different samples using CoverM.

## Usage

Follow the scripts in the order listed above to perform a complete analysis of soil shotgun metagenomics data. Each script is designed to be run in sequence, with input and output directories set up to match the needs of the following steps.
