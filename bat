#!/bin/sh
# bat - Check battery level and charging state.

# Path of the battery device
bat="/sys/class/power_supply/BAT0"

charge_full=$(cat "$bat/charge_full")
charge_now=$(cat "$bat/charge_now")
perc=$((100 * ${charge_now} / ${charge_full}))
bat_status=$(cat "$bat/status")
status_symbol=""

if [ "$bat_status" = "Charging" ]
    then status_symbol="+"
elif [ "$bat_status" = "Discharging" ]
    then status_symbol="-"
fi

echo "$status_symbol$perc%"
