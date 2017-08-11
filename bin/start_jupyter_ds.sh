#!/bin/bash

set -o nounset -o errexit

HOST_PORT=8888
CONTAINER_PORT=8888
NOTEBOOK=jupyter/datascience-notebook

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
