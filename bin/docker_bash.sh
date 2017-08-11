#!/bin/bash

set -o nounset -o errexit

CONTAINER_ID=$1

# --interactive Keep STDIN open even if not attached
# -tty Allocate a pseudo-TTY
docker exec --interactive --tty $CONTAINER_ID /bin/bash
