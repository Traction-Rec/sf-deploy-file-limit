#!/bin/bash

# Check if directory is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Count files and directories
file_count=$(find "$1" -type f | wc -l)
dir_count=$(find "$1" -type d | wc -l)

# Output the counts
echo "Number of files: $file_count"
echo "Number of directories: $dir_count"