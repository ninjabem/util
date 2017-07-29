#!/bin/bash

set -o nounset -o errexit

BIN=$HOME/bin
WORK=$HOME/work

sudo add-apt-repository ppa:webupd8team/sublime-text-3

# SBT :-(
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

sudo apt-get update

sudo apt-get install --assume-yes \
    chromium-browser \
    git \
    tig \
    emacs24 \
    tmux \
    sublime-text-installer \
    openjdk-8-jdk \
    scala \
    expect \
    secure-delete \
    pwgen

sudo apt-get install --assume-yes \
    sbt

mkdir $BIN
mkdir $WORK

ssh-keygen -t rsa -b 4096 -N "" -f $HOME/.ssh/id_rsa

pushd $WORK
git clone https://github.com:ninjabem/util.git
echo "source $HOME/.bash_lol_secrets" >> $HOME/.bashrc
echo "source $HOME/.bash_lol" >> $HOME/.bashrc
cd util/init/ubuntu
cp .bash_lol_secrets ~
cp .bash_lol ~
popd
