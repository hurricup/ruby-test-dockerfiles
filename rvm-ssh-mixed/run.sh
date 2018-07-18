#!/bin/sh

docker stop rvm_mixed
docker build -t rvm_mixed .
docker run -d --rm -p 6026:22 --name rvm_mixed rvm_mixed
