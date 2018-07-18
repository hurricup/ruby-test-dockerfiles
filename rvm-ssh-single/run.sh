#!/bin/sh

docker stop rvm_single
docker build -t rvm_single .
docker run -d --rm -p 6023:22 --name rvm_single rvm_single
