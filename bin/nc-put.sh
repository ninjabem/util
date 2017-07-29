#!/bin/bash

set -o nounset -o errexit

IP=$1
FILE=$2
PORT=58485

echo "sending file $FILE to $IP:$PORT"

nc $IP $PORT < $FILE

echo "DONE"
