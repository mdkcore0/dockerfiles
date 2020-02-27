#!/bin/sh

IMAGE=${IMAGE:-openvino-opencv:latest}


(
    docker run \
        --rm \
        --user "$UID:$(id -g)" \
        -it \
        -v $PWD:/opt/src \
        $IMAGE
)
