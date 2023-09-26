#!/bin/bash

for tzone in /sys/class/thermal/thermal_zone*; do
  tzone_num=${tzone#*_zone}
  if [[ $tzone == *"thermal_zone"* ]]; then
    temp=$(cat "$tzone/temp")
    temp=$((temp/1000))
    echo "CPU$tzone_num temperature: $temp°C"
  fi
done


# only for raspberrypi
vcgencmd measure_temp
