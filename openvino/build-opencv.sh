#!/bin/sh

DOCKER_PATH="$(pwd)/$(dirname "$0")"


cd "$DOCKER_PATH" || exit
(
    docker build --tag openvino-opencv:latest -f Dockerfile.opencv .
)
