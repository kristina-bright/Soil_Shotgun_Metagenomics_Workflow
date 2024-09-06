#!/bin/bash

# Create directories for assembly
mkdir -p 02_Assembly/metaspades

# Run MetaSPAdes on all samples
for sample in $(cat samples.txt); do
  identifiers=$(ls 00_raw/01.RawData/${sample}/${sample}_*1.fq.gz | sed -e "s/^.*${sample}_//" -e 's/_1.fq.gz//' | sort -u)
  for id in $identifiers; do
    file_r1="00_raw/01.RawData/${sample}/${sample}_${id}_1.fq.gz"
    file_r2="00_raw/01.RawData/${sample}/${sample}_${id}_2.fq.gz"
    # Check if the files exist
    if [[ -f $file_r1 && -f $file_r2 ]]; then
      metaspades.py -1 $file_r1 -2 $file_r2 -o 02_Assembly/metaspades/${sample}_${id} --threads 40 --memory 400
    else
      echo "Input files for sample ${sample} identifier ${id} not found."
    fi
  done
done
