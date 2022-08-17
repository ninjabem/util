#!/bin/bash

# Exit the script if any variables specified are unset when accessed
set -o nounset

if [ $# -eq 0 ]; then
 echo >&2 "Usage: thread-dump <pid> [ <count> [ <delay> ] ]"
 echo >&2 " Defaults: count = 10, delay = 2 (seconds)"
 exit 1
fi

PID=$1 # required
COUNT=${2:-10} # defaults to 10 times
DELAY=${3:-2} # defaults to 2 seconds
TARGET_DIR=/var/tmp

while [ $COUNT -gt 0 ]
do
 TARGET="$TARGET_DIR/jstack.pid-$PID.utc-$(date +%H%M%S)"
 echo -n "dumping threads to $TARGET"
 jstack -l $PID > $TARGET
 echo " ...DONE"
 sleep $DELAY
 let COUNT--
done

tar cfz $TARGET_DIR/dumps.tgz $TARGET_DIR/jstack*
