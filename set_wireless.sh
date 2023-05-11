#!/bin/bash
set -x

ifconfig
iwconfig
rfkill list
sudo rfkill unblock wifi

ifconfig

read -p "THU Wireless Username: " USERNAME
read -s -p "THU Wireless Password: " PASSWORD

cp thu_wireless_wpa.conf.temp thu_wireless_wpa.conf
sed -i "s/USERNAME/${USERNAME}/g" thu_wireless_wpa.conf
sed -i "s/PASSWORD/${PASSWORD}/g" thu_wireless_wpa.conf


sudo mv thu_wireless_wpa.conf /etc/wpa_supplicant/wpa_supplicant-wlan0.conf
sudo chmod 400 /etc/wpa_supplicant/wpa_supplicant-wlan0.conf

sudo systemctl enable wpa_supplicant@wlan0.service
sudo systemctl enable dhcpcd

sudo systemctl start wpa_supplicant@wlan0.service
sudo systemctl start dhcpcd
