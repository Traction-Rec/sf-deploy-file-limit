#!/bin/bash

# Define the source folder and base directory
SOURCE_FOLDER="force-app/main/default/classes"
BASE_DIR="force-app/main/default"
DEPTH=1001
BATCH_SIZE=100

# Create the deep directory structure in batches
CURRENT_DIR=$BASE_DIR
for ((i=1; i<=DEPTH; i++)); do
  CURRENT_DIR="$CURRENT_DIR/$i"
  mkdir -p "$CURRENT_DIR"
  
  # Move the folder in batches to avoid long path issues
  if (( i % BATCH_SIZE == 0 )); then
    mv "$SOURCE_FOLDER" "$CURRENT_DIR"
    SOURCE_FOLDER="$CURRENT_DIR/$(basename $SOURCE_FOLDER)"
  fi
done

# Final move to the deepest directory if not already there
if [ "$SOURCE_FOLDER" != "$CURRENT_DIR/$(basename $SOURCE_FOLDER)" ]; then
  mv "$SOURCE_FOLDER" "$CURRENT_DIR"
fi

echo "Moved $SOURCE_FOLDER to $CURRENT_DIR"