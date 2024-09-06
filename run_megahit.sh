#!/bin/bash

# Create directories for assembly
mkdir -p 02_Assembly/megahit

# Run MEGAHIT on all samples
for sample in $(cat samples.txt); do
  identifiers=$(ls 00_raw/01.RawData/${sample}/${sample}_*1.fq.gz | sed -e "s/^.*${sample}_//" -e 's/_1.fq.gz//' | sort -u)
  for id in $identifiers; do
    file_r1="00_raw/01.RawData/${sample}/${sample}_${id}_1.fq.gz"
    file_r2="00_raw/01.RawData/${sample}/${sample}_${id}_2.fq.gz"
    # Check if the files exist
    if [[ -f $file_r1 && -f $file_r2 ]]; then
      megahit -1 $file_r1 -2 $file_r2 -o 02_Assembly/megahit/${sample}_${id} -t 40 --presets meta-sensitive --min-contig-len 500 -m $((400 * 1024**3))
    else
      echo "Input files for sample ${sample} identifier ${id} not found."
    fi
  done
done

# Troubleshooting: Changed samples.txt to 1 sample and tried again
# This approach worked for the specific issue encountered on 21.01.24
