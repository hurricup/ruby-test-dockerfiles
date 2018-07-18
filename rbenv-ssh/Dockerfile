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

run git clone https://github.com/rbenv/rbenv.git ~/.rbenv
run cd ~/.rbenv && src/configure && make -C src
run git clone git://github.com/jf/rbenv-gemset.git ~/.rbenv/plugins/rbenv-gemset
run echo 'export PATH="~/.rbenv/bin:$PATH"' >> ~/.bashrc
run echo 'eval "$(rbenv init -)"' >> ~/.bashrc
run git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
run ~/.rbenv/bin/rbenv install 2.5.1
run ~/.rbenv/bin/rbenv install 2.4.4
run ~/.rbenv/bin/rbenv install 2.3.7
############################################### common part ############################################################
# need to start sshd
USER root
