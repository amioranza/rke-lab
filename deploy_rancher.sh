#!/usr/bin/env bash
sudo apt-get update -qq > /dev/null 2>&1 
sudo apt-get -y install docker.io
sudo docker run -d --name rancher -p 80:80 -p 443:443 rancher/rancher:master