#!/usr/bin/env bash

IMAGE=${1:-3dcitydb/wfs}

docker rm -f -v wfs
