#!/bin/bash
set -x

lsb_release -a
sudo cp thu_apt_sources.list /etc/apt/sources.list
sudo apt update
sudo apt upgrade -y
sudo apt install -y vim git python3-pip 

# for dig
sudo apt install -y dnsutils
