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

echo "PS1=\"\[\033[01;32m\][WebServer:${az} \t \u@\h:\w] $\[\033[00m\] \"" >> /home/ec2-user/.bashrc
echo "PS1=\"\[\033[01;31m\][WebServer:${az} \t jobs:\j \u@\h:\w] #\[\033[00m\] \"" >> /root/.bashrc
echo "PS1=\"\[\033[01;32m\][WebServer:${az} \t \u@\h:\w] $\[\033[00m\] \"" >> /etc/skel/.bashrc

sed -i 's/^#PrintLastLog.*/PrintLastLog no/g' /etc/ssh/sshd_config
systemctl restart sshd.service
sed -i 's/^https.*//g' /etc/motd

echo "[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/\$basearch/
gpgcheck=0
enabled=1" > /etc/yum.repos.d/nginx.repo

setenforce 0
sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config

yum update -y
yum install nginx -y

mkdir -p /var/www/html

cat <<EOF > /var/www/html/index.html
<html>
    <h1>
        Managed by Terraform
    </h1>
    <h2>
        hello from ${az}
    </h2>
</html>
EOF
chown -R nginx. /var/www/*
rm -rf /etc/nginx/conf.d/default.conf

cat <<EOF > /etc/nginx/conf.d/default.conf
server {
    listen       80;
    server_name  2pizza.info;

    access_log  /var/log/nginx/2pizza.info-access.log  main;
    error_log /var/log/nginx/2pizza.info-error.log;

    root /var/www/html;
    index index.html;

    location = / { }

    set_real_ip_from 192.168.0.0/16;
    real_ip_header   X-Forwarded-For;
}
EOF

systemctl enable nginx.service
systemctl restart nginx.service
