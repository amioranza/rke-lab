#!/usr/bin/env bash
sudo apt-get update -qq > /dev/null 2>&1 
sudo apt-get -y install docker.io
sudo usermod -aG docker vagrant