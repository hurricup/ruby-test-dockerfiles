#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: build.sh dirname"
    exit -1
fi

./assembler.rb < $1/Dockerfile.skeleton > $1/Dockerfile

docker build -t $1 $1/