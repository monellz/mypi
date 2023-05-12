#!/bin/bash
set -x

sudo mv aarch64-qbittorrent-nox /usr/sbin/aarch64-qbittorrent-nox

PORT=30000

crontab -l > conf
echo "@reboot sleep 10 && /usr/sbin/aarch64-qbittorrent-nox -d --webui-port=${PORT}" >> conf && crontab conf && rm -f conf

aarch64-qbittorrent-nox -d --webui-port=${PORT}
