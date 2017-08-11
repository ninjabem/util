#!/bin/bash

set -o nounset -o errexit

# https://hub.docker.com/r/jupyter/jupyter/tensorflow-notebook/
# docker pull jupyter/tensorflow-notebook
NOTEBOOK=jupyter/tensorflow-notebook
HOST_PORT=7777
CONTAINER_PORT=8888

echo
echo "==========================="
echo "STARTING ON PORT $HOST_PORT"
echo "==========================="
echo

# --interactive Keep STDIN open even if not attached
# -tty Allocate a pseudo-TTY
# --rm Automatically remove the container when it exits
# -p Publish a container's port(s) to the host
docker run --interactive --tty --rm -p $HOST_PORT:$CONTAINER_PORT $NOTEBOOK
