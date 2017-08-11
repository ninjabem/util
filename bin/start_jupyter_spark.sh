#!/bin/bash

set -o nounset -o errexit

# https://hub.docker.com/r/jupyter/all-spark-notebook
# docker pull jupyter/all-spark-notebook
NOTEBOOK=jupyter/all-spark-notebook
HOST_PORT=5555
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
