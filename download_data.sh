#!/bin/bash

# Step 1: Connect to the cluster
ssh username@jed.epfl.ch

# Step 2: Navigate to the working directory
cd /work
cd soil

# Step 3: Create a directory for the project
mkdir metagenome_001
cd metagenome_001/

# Step 4: Download the data files
wget [add link here]
