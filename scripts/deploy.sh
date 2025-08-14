#!/bin/bash
set -euo pipefail

APP_NAME=final-python
IMAGE="iyousef1/final-python:latest"
PORT_HOST=80
PORT_CONTAINER=5000

# Stop/remove old container if exists
if [ "$(docker ps -aq -f name=$APP_NAME)" ]; then
  docker rm -f $APP_NAME || true
fi

# Always pull the newest image
docker pull "$IMAGE"

# Run new container mapping 80->5000
docker run -d --name $APP_NAME -p ${PORT_HOST}:${PORT_CONTAINER} "$IMAGE"
