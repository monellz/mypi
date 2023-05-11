#!/bin/bash
set -x


./set_wireless.sh

sleep 3
./upgrad.sh

./set_send_ip.sh




./config.sh
