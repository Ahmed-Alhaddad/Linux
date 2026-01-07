#!/bin/bash

for files in *.pdf; do
dir=$(echo "$files" | grep -o "[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]") # extract first E## from filename
mkdir -p "$dir"  # create dir
mv "$files" "$dir"
done