#!/bin/bash
set -x

read -p "THU mail Username: " USERNAME
read -s -p "THU mail Password: " PASSWORD

cp mysendmail.temp mysendmail
sed -i "s/USERNAME/${USERNAME}/g" mysendmail
sed -i "s/PASSWORD/${PASSWORD}/g" mysendmail

sudo mv mysendmail /usr/sbin/mysendmail
sudo chmod 700 /usr/sbin/mysendmail

crontab -l > conf
echo '@reboot sleep 10 && /usr/sbin/mysendmail -s "current ip" -t "$(dig @resolver4.opendns.com myip.opendns.com +short)" > /tmp/mysendmail 2>&1' >> conf && crontab conf && rm -f conf

# send now
mysendmail -s "current ip" -t "$(dig @resolver4.opendns.com myip.opendns.com +short)
