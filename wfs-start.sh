#!/usr/bin/env bash

IMAGE=${1:-3dcitydb/wfs}

docker rm -f -v wfs
docker run -d -t --rm --name wfs \
    --network citydb-net \
    -p 8080:8080 \
    -e CITYDB_HOST=citydb \
    -e CITYDB_NAME=postgres \
    -e CITYDB_USERNAME=postgres \
    -e CITYDB_PASSWORD=changeMe \
    -e WFS_CONTEXT_PATH=wfs \
  "$IMAGE"
