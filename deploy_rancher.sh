#!/usr/bin/env bash
sudo apt-get update -qq > /dev/null 2>&1 
sudo apt-get -y install docker.io
sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 -v /opt/rancher:/var/lib/rancher rancher/rancher:v2.2.0