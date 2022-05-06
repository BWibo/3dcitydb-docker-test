#!/usr/bin/env bash

IMAGE_IMPEXP=${1:-3dcitydb/impexp:latest-alpine}
DATASET=${2:-data/citygml/Railway_Scene_LoD3.zip}
IMAGE_CITYDB=${3:-3dcitydb/3dcitydb-pg:latest-alpine}
SRID=${4:-3068}

./cleanup.sh
./network-create.sh
./citydb-create.sh "$IMAGE_CITYDB" "$SRID"

# Wait for psql to become available
docker run --rm -t --name wait-for-psql \
  --network citydb-net \
  bwibo/wait-for-psql 60 citydb 5432 postgres changeMe

# Import LoD3 Railway example
docker run -i -t --rm --name impexp \
    --network citydb-net \
    -v "$PWD":/data \
  "$IMAGE_IMPEXP" import \
    -H citydb \
    -d postgres \
    -u postgres \
    -p changeMe \
    "/data/$DATASET"
