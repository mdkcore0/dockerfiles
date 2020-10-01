#!/bin/sh

VERSION=${VERSION:-latest}
IMAGE=koalaman/shellcheck:$VERSION

(
    podman run \
        --rm \
        -v "$PWD":/mnt \
        "$IMAGE" "$@"
)
