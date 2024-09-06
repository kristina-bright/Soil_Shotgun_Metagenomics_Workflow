#!/bin/bash

# Load dRep module
conda activate dRep

# Set directories
BASE_DIR="/work/soil/metagenome_001"
DREP_DIR="${BASE_DIR}/06_Representative_MAGs/drep"

# Run dRep
dRep dereplicate $DREP_DIR --genomeDir $BASE_DIR/04_Binning/metabat2/all_bins -comp 50 -con 10 -sa 0.98
