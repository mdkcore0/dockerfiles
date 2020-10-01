#!/bin/sh

# latest == busybox
# TODO alpine?
VERSION=${VERSION:-latest}
# TODO jojomi/hugo?
IMAGE=klakegg/hugo:$VERSION

(
    podman run --rm -it \
        -v "$PWD":/mnt \
        "$IMAGE" "$@"
)
