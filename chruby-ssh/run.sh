#!/bin/sh

docker stop chruby
docker build -t chruby .
docker run -d --rm -p 6029:22 --name chruby chruby
