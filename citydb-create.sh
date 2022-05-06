#!/usr/bin/env bash

IMAGE=${1:-3dcitydb/3dcitydb-pg}
SRID=${2:-3068}

docker run --name citydb -d -t \
    --network citydb-net \
    -e POSTGRES_PASSWORD=changeMe \
    -e SRID=$SRID \
  "$IMAGE"
