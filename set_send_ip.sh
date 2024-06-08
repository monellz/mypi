#!/bin/bash
set -x

crontab -l > conf
sending_cmd='@reboot while ! /usr/sbin/mysendmail -s "current ip" -t "$(dig @resolver4.opendns.com myip.opendns.com +short)"; do sleep 5; done'
if [ `grep -c -F "${sending_cmd}" conf` -ne '0' ]; then
    echo "crontab has contained sending_cmd"
else
    echo "$sending_cmd" >> conf && crontab conf && rm -f conf
fi

# send now
mysendmail -s "current ip" -t "$(dig @resolver4.opendns.com myip.opendns.com +short)"
