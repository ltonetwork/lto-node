#!/bin/bash
yum install -y wget
cd /tmp
wget -O lto.tar.gz https://github.com/legalthings/lto/archive/v0.2.0.tar.gz
tar -xvf lto.tar.gz
mv lto-0.2.0/docker-compose.yml .
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

su - ec2-user -c 'docker-compose -f /tmp/docker-compose.yml up -d'
