#!/bin/sh

DOCKER_PATH="$(pwd)/$(dirname "$0")"


cd "$DOCKER_PATH" || exit
(
    docker build --tag openvino:2020.1 .
)
