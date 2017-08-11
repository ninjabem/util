#!/bin/bash

set -o nounset -o errexit

# activate TF's virtualenv

TF_DIR=$HOME/tensorflow
ACTIVATION=$TF_DIR/bin/activate

source $ACTIVATION
