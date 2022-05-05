#!/usr/bin/env bash

# IMAGE=3dcitydb/impexp:latest-alpine
IMAGE=impexp
EXPORT_FOLDER=temp/citygml

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
