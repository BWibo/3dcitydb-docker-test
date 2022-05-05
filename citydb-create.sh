#!/usr/bin/env bash

docker run --name citydb -d -t \
    -p 5432:5432 \
    --network citydb-net \
    -e POSTGRES_PASSWORD=changeMe \
    -e SRID=3068 \
  3dcitydb/3dcitydb-pg
