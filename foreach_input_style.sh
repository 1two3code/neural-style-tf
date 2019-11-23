#!/bin/bash

# Return all input and style combinations that does not exist in ./output

OUTPUT_DIR="/mnt/efsvol/neural-style-tf/output"

INPUT="$1/*"
STYLES="$2/*"
for i in $INPUT
do
  for s in $STYLES
  do
    # file="$(basename "$i").$(basename "$s")"
    # if [[ -f "$OUTPUT_DIR/$file" ]]; then
    #   echo "$file exist"
    # fi
    ./stylize_image.sh $i $s
  done
done