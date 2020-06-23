#!/usr/bin/env bash

set -euo pipefail --

docker run -d \
  --rm \
  --init \
  --name mastery_pg \
  --network host \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres1234 \
  -e POSTGRES_DB=videoezy \
  -v $PWD/volumes/data:/var/lib/postgresql/data \
  postgres:12.3