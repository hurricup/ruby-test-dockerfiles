#!/bin/sh

docker stop rvm_multi
docker build -t rvm_multi .
docker run -d --rm -p 6024:22 --name rvm_multi rvm_multi
