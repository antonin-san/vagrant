#!/usr/bin/env bash   

# Export variables
export VAGRANT=/home/vagrant
export KANJI=$VAGRANT/kanji

# Run containers
cd $KANJI/main
make up