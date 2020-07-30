#!/bin/sh

VERSION=${VERSION:-latest}
NODE_PATH=$(dirname -- "$(readlink -f "$0")")

(
    VERSION=$VERSION "$NODE_PATH"/_node npx "$@"
)
