#!/bin/bash

# Exit the script if any variables specified are unset when accessed
set -o nounset

CONTAINER=$1
SCRIPT=thread-dumper.sh
DIR=/var/tmp
EXTRACT=dumps.tgz

docker cp $SCRIPT $CONTAINER:$DIR/
docker exec -t $DIR/$SCRIPT 1
docker cp $CONTAINER:$DIR/$EXTRACT .
