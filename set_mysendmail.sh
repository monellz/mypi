#!/bin/bash
set -x

LOGFILE="/tmp/mysendmail"
touch $LOGFILE

read -p "THU mail Username: " USERNAME
read -s -p "THU mail Password: " PASSWORD

cp mysendmail.temp mysendmail
sed -i "s/USERNAME/${USERNAME}/g" mysendmail
sed -i "s/PASSWORD/${PASSWORD}/g" mysendmail
sed -i "s|LOGFILE|${LOGFILE}|g" mysendmail


sudo mv mysendmail /usr/sbin/mysendmail
sudo chmod 700 /usr/sbin/mysendmail

crontab -l > conf
clean_cmd="0 0 1 * * truncate -s 0 ${LOGFILE}"
if [ `grep -c -F "${clean_cmd}" conf` -ne '0' ]; then
    echo "crontab has contained clean_cmd"
else
    echo "$clean_cmd" >> conf && crontab conf && rm -f conf
fi
