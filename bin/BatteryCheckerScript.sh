#!/bin/bash

while true; do
echo "BATTERY POWER CHECK"
chekpc=18
state=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "state" | awk '{print $2}'`
pc=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" | awk '{print $2}' | cut -d'%' -f1`
if [[ "$pc" -le "$chekpc" && "$state" == "discharging" ]]; then
    zenity --error --text="Connect charger"
fi
sleep 30
done
