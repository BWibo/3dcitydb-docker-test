#!/usr/bin/env bash

IMAGE=impexp
EXPORT_FOLDER=temp/glTF

if [ -d "$EXPORT_FOLDER" ]; then
  rm -rf "$EXPORT_FOLDER"/*
else
  mkdir -p"$EXPORT_FOLDER"
fi

docker run -i -t --rm --name impexp \
    --network citydb-net \
    -v "$PWD":/data \
  "$IMAGE" export-vis \
    -H citydb \
    -d postgres \
    -u postgres \
    -p changeMe \
    -l halod \
    -D collada \
    -G \
    --gltf-binary \
    --gltf-embed-textures \
    --gltf-draco-compression \
    -O 0 \
    -o /data/temp/glTF/railway-lod3.kml
