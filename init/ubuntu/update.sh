#!/bin/bash

set -o nounset -o errexit

sudo apt-get update
sudo apt-get upgrade
sudo apt autoremoce
