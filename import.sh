#!/usr/bin/env bash

IMAGE=impexp

./cleanup.sh
./network-create.sh
./citydb-create.sh

# ./wait-for-psql.sh 60 localhost 5432 postgres changeMe

docker run --rm --name wait-for-psql \
  --network citydb-net \
  bwibo/wait-for-psql 60 citydb 5432 postgres changeMe

docker run -i -t --rm --name impexp \
    --network citydb-net \
    -v "$PWD":/data \
  "$IMAGE" import \
    -H citydb \
    -d postgres \
    -u postgres \
    -p changeMe \
    /data/data/citygml/Railway_Scene_LoD3.zip
