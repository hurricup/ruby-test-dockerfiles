#!/bin/sh

docker stop rbenv
docker build -t rbenv .
docker run -d --rm -p 6028:22 --name rbenv rbenv
