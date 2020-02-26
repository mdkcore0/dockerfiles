#!/bin/sh

(
    docker run \
        --rm \
        --user "$UID:$(id -g)" \
        -it \
        -v $PWD:/opt/src \
        openvino-opencv:latest
)
