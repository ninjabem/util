#!/bin/bash

set -o nounset -o errexit

FILE=$1
PORT=58485

echo "listening on port $PORT and writing to file $FILE"

nc -l -p $PORT > $FILE

echo "DONE"

ls -lh $FILE
