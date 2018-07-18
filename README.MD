Dockerfiles for test servers with ruby version managers.

Each server has a version manager and vew rubies installed.

Also, each server has `sshd` enabled on different ports, see respective `run.sh`

There are two users in servers: `root:root` and `user:user`

`run.sh` stops working container, builds a `Dockerfile` and starts container again.

NB: These containers are not suitable for docker testing, only ssh. Docker containers should be built with root user only.