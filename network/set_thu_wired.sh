#!/bin/bash
set -x

sudo cp auth-thu/auth-thu.linux.arm64 /usr/local/bin/auth-thu
sudo cp -r auth-thu/systemd/* /etc/systemd 


read -p "THU Wireless/Wired Username: " USERNAME
read -s -p "THU Wireless/Wired Password: " PASSWORD

cp auth-thu.json.temp auth-thu.json
sed -i "s/USERNAME/${USERNAME}/g" auth-thu.json
sed -i "s/PASSWORD/${PASSWORD}/g" auth-thu.json


mv auth-thu.json ~/.auth-thu


sudo systemctl enable goauthing@${USER}.service
