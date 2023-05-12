#!/bin/bash
set -x

# ref: https://github.com/Dreamacro/clash/releases/tag/premium

CLASH=clash-linux-arm64-2023.04.16
sudo cp ${CLASH} /usr/local/bin/clash
sudo cp config.yaml /etc/clash/
sudo cp Country.mmdb /etc/clash/

sudo cp clash.service /etc/systemd/system/clash.service

# default port: 7890
sudo systemctl daemon-reload
sudo systemctl enable clash
sudo systemctl start clash
sudo systemctl status clash
sudo journalctl -xe
