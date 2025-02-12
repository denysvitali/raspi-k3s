#!/bin/sh
DOCKER_IMAGE=${1:-registry.gitlab.com/raspi-alpine/builder/3-21:latest}

if [ "$DOCKER_IMAGE" = "" ]; then
  echo "Usage: $0 <docker_image>"
  exit 1
fi

docker run \
  --rm \
  -v "$PWD"/input:/input \
  -v "$PWD"/output:/output \
  --env-file .env \
  "$DOCKER_IMAGE"
