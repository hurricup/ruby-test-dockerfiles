#!/bin/sh
docker stop asdf
docker build -t asdf .
docker run -d --rm -p 6027:22 --name asdf asdf
