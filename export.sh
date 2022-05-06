#!/usr/bin/env bash

IMAGE=${1:-3dcitydb/impexp}
EXPORT_FOLDER=${2:-temp/citygml}

if [ -d "$EXPORT_FOLDER" ]; then
  rm -rf "$EXPORT_FOLDER"/*
else
  mkdir -p "$EXPORT_FOLDER"
fi

docker run -i -t --rm --name impexp \
    --network citydb-net \
    -v "$PWD":/data \
  "$IMAGE" export \
    -H citydb \
    -d postgres \
    -u postgres \
    -p changeMe \
    -o /data/"$EXPORT_FOLDER"/railway-lod3.gml
