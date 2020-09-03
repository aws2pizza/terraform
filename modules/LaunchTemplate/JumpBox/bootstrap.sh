#!/bin/bash

yum update -y
amazon-linux-extras install -y epel
yum install -y awscli vim bash-completion httpie perl python curl wget nmap-ncat tree iptables iptables-services htop

echo "# locale
LANG=\"en_US.UTF-8\"
LANGUAGE=\"en_US.UTF-8\"
LC_CTYPE=\"en_US.UTF-8\"
LC_ALL=\"en_US.UTF-8\"
" >> /etc/environment

echo "syntax on" > /root/.vimrc

az="`curl -s 169.254.169.254/latest/meta-data/placement/availability-zone`"

echo "PS1=\"\[\033[01;33m\][JumpBox:${az} \t \u@\h:\w] $\[\033[00m\] \"" >> /home/ec2-user/.bashrc
echo "PS1=\"\[\033[01;31m\][JumpBox:${az} \t jobs:\j \u@\h:\w] #\[\033[00m\] \"" >> /root/.bashrc
echo "PS1=\"\[\033[01;33m\][JumpBox:${az} \t \u@\h:\w] $\[\033[00m\] \"" >> /etc/skel/.bashrc

sed -i 's/^#PrintLastLog.*/PrintLastLog no/g' /etc/ssh/sshd_config
systemctl restart sshd.service
sed -i 's/^https.*//g' /etc/motd

echo -e "Host *\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile = /dev/null\n\tLogLevel QUIET" > /home/ec2-user/.ssh/config
