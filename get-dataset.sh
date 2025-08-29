#!/bin/bash
set -e

DATA_DIR="data/raw"
ZIP_FILE="$DATA_DIR/smart-grid-electricity-marketing-dataset.zip"

echo "[INFO] Preparing dataset..."

if [ ! -d "$DATA_DIR" ]; then
  echo "[INFO] Creating directory: $DATA_DIR"
  mkdir -p "$DATA_DIR"
else
  echo "[INFO] Directory already exists: $DATA_DIR"
fi

if [ "$(ls -A $DATA_DIR)" ]; then
  echo "[INFO] Dataset already present in $DATA_DIR. Skipping download."
else
  echo "[INFO] Downloading dataset..."
  curl -L --progress-bar -o "$ZIP_FILE" \
    https://www.kaggle.com/api/v1/datasets/download/ziya07/smart-grid-electricity-marketing-dataset

  echo "[INFO] Unzipping dataset..."
  unzip -o "$ZIP_FILE" -d "$DATA_DIR" > /dev/null

  echo "[INFO] Cleaning up zip file..."
  rm "$ZIP_FILE"

  echo "[INFO] Dataset is ready in $DATA_DIR."
fi
