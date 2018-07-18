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

# chruby
run cd &&  wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz && tar -xzvf chruby-0.3.9.tar.gz && cd chruby-0.3.9/ && sudo make install
run echo ". /usr/local/share/chruby/chruby.sh\n" >> ~/.bashrc
run cd && wget -O ruby-install-0.6.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.1.tar.gz  && tar -xzvf ruby-install-0.6.1.tar.gz  && cd ruby-install-0.6.1/ && sudo make install
run sudo apt install -y jruby
run sudo apt install -y ruby
run ruby-install ruby
run ruby-install ruby-2.3.7
run ruby-install ruby-2.4.4
run ruby-install ruby-2.5.1

############################################### common part ############################################################
# need to start sshd
USER root
