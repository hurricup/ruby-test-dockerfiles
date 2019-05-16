# with-from
FROM rubymine_ubuntu:16.04

# with-sshd
EXPOSE 22
USER root
RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd
RUN echo "# Package generated configuration file\n# See the sshd_config(5) manpage for details\n\n# What ports, IPs and protocols we listen for\nPort 22\n# Use these options to restrict which interfaces/protocols sshd will bind to\n#ListenAddress ::\n#ListenAddress 0.0.0.0\nProtocol 2\n# HostKeys for protocol version 2\nHostKey /etc/ssh/ssh_host_rsa_key\nHostKey /etc/ssh/ssh_host_dsa_key\nHostKey /etc/ssh/ssh_host_ecdsa_key\nHostKey /etc/ssh/ssh_host_ed25519_key\n#Privilege Separation is turned on for security\nUsePrivilegeSeparation yes\n\n# Lifetime and size of ephemeral version 1 server key\nKeyRegenerationInterval 3600\nServerKeyBits 1024\n\n# Logging\nSyslogFacility AUTH\nLogLevel INFO\n\n# Authentication:\nLoginGraceTime 120\nPermitRootLogin yes\n#without-password\nStrictModes yes\n\nRSAAuthentication yes\nPubkeyAuthentication yes\n#AuthorizedKeysFile	%h/.ssh/authorized_keys\n\n# Don't read the user's ~/.rhosts and ~/.shosts files\nIgnoreRhosts yes\n# For this to work you will also need host keys in /etc/ssh_known_hosts\nRhostsRSAAuthentication no\n# similar for protocol version 2\nHostbasedAuthentication no\n# Uncomment if you don't trust ~/.ssh/known_hosts for RhostsRSAAuthentication\n#IgnoreUserKnownHosts yes\n\n# To enable empty passwords, change to yes (NOT RECOMMENDED)\nPermitEmptyPasswords no\n\n# Change to yes to enable challenge-response passwords (beware issues with\n# some PAM modules and threads)\nChallengeResponseAuthentication no\n\n# Change to no to disable tunnelled clear text passwords\n#PasswordAuthentication yes\n\n# Kerberos options\n#KerberosAuthentication no\n#KerberosGetAFSToken no\n#KerberosOrLocalPasswd yes\n#KerberosTicketCleanup yes\n\n# GSSAPI options\n#GSSAPIAuthentication no\n#GSSAPICleanupCredentials yes\n\nX11Forwarding yes\nX11DisplayOffset 10\nPrintMotd no\nPrintLastLog yes\nTCPKeepAlive yes\n#UseLogin no\n\n#MaxStartups 10:30:60\n#Banner /etc/issue.net\n\n# Allow client to pass locale environment variables\nAcceptEnv LANG LC_*\n\nSubsystem sftp /usr/lib/openssh/sftp-server\n\n# Set this to 'yes' to enable PAM authentication, account processing,\n# and session processing. If this is enabled, PAM authentication will\n# be allowed through the ChallengeResponseAuthentication and\n# PasswordAuthentication.  Depending on your PAM configuration,\n# PAM authentication via ChallengeResponseAuthentication may bypass\n# the setting of PermitRootLogin without-password.\n# If you just want the PAM account and session checks to run without\n# PAM authentication, then enable this but set PasswordAuthentication\n# and ChallengeResponseAuthentication to 'no'.\nUsePAM yes\n" > /etc/ssh/sshd_config
USER user

# with-user
USER user

# with-rbenv
run git clone https://github.com/rbenv/rbenv.git ~/.rbenv
run cd ~/.rbenv && src/configure && make -C src
run git clone git://github.com/jf/rbenv-gemset.git ~/.rbenv/plugins/rbenv-gemset
run echo 'export PATH="~/.rbenv/bin:$PATH"' >> ~/.bashrc
run echo 'eval "$(rbenv init -)"' >> ~/.bashrc
run git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
run ~/.rbenv/bin/rbenv install 2.1.10
run ~/.rbenv/bin/rbenv install 2.2.10
run ~/.rbenv/bin/rbenv install 2.3.8
run ~/.rbenv/bin/rbenv install 2.4.6
run ~/.rbenv/bin/rbenv install 2.5.5
run ~/.rbenv/bin/rbenv install 2.6.3

