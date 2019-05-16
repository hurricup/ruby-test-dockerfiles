FROM ubuntu:16.04
# software update & install
RUN apt update && apt -y upgrade
RUN apt install -y software-properties-common gcc cmake mc openssh-server curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev ruby ruby-dev nodejs libmysqlclient-dev git rsync rsyslog sudo gnupg2 gawk autoconf automake bison libgdbm-dev libncurses5-dev libtool pkg-config openjdk-8-jre-headless
RUN apt install -y bash zsh tcsh csh fish
RUN apt install -y jruby

# creating user:user
RUN echo 'root:root' | chpasswd
RUN adduser user --disabled-password --gecos "User"
RUN usermod -aG sudo user
RUN echo 'user:user' | chpasswd
RUN echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER user