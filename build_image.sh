#!/bin/sh
DOCKER_IMAGE=${1:-ghcr.io/raspi-alpine/builder}

if [ "$DOCKER_IMAGE" = "" ]; then
  echo "Usage: $0 <docker_image>"
  exit 1
fi

docker run \
  --rm \
  -it \
  -v "$PWD"/input:/input \
  -v "$PWD"/output:/output \
  --env-file .env \
  "$DOCKER_IMAGE"
