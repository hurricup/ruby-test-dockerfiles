FROM ubuntu:16.04
# software update & install
RUN apt update && apt -y upgrade
RUN apt install -y software-properties-common gcc cmake mc openssh-server curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev ruby ruby-dev nodejs libmysqlclient-dev git rsync rsyslog sudo gnupg2 gawk autoconf automake bison libgdbm-dev libncurses5-dev libtool pkg-config openjdk-8-jre-headless

# sshd configuration & set password
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd
COPY sshd_config /etc/ssh/sshd_config
RUN echo 'root:root' | chpasswd
RUN adduser user --disabled-password --gecos "User"
RUN usermod -aG sudo user
RUN echo 'user:user' | chpasswd
RUN echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER user

# project dir
RUN mkdir ~/project
############################################### common part ############################################################
# rvm
run bash -c "\curl -sSL https://get.rvm.io | bash"
run gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
run bash -c ". ~/.profile && rvm get head"
run bash -c ". ~/.profile && rvm install ruby-2.5"
run bash -c ". ~/.profile && rvm install ruby-2.4"
run bash -c ". ~/.profile && rvm install ruby-2.3"
run bash -c ". ~/.profile && rvm install jruby"
run bash -c ". ~/.profile && rvm use 2.4 && rvm gemset create set1 set2 set"

############################################### common part ############################################################
# need to start sshd
USER root
