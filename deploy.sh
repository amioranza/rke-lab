#!/usr/bin/env bash
echo "Update local package cache"
sudo apt-get update -qq > /dev/null 2>&1 
sudo apt-get -y install docker.io
sudo usermod -aG docker vagrant
