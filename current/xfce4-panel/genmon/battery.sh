#!/bin/bash

# XFCE4 Panel GenMon script for battery percentage.

readonly BATTERY=$(awk '{print $1}' /sys/class/power_supply/BAT0/capacity)

#Set your custom low_battery level
LOW_BATTERY=25;

INFO=
if [ "${BATTERY}" -lt "${LOW_BATTERY}" ]; then                # battery is too low ; don't make me appear ; charge it before reaching this condition
  batteryIcon=$(echo "\uf244 ")
elif [ "${BATTERY}" -ge 25 ] && [ "${BATTERY}" -lt 50 ]; then # if battery is charged between 25 and 50
  batteryIcon=$(echo "\uf243 ")
elif [ "${BATTERY}" -ge 50 ] && [ "${BATTERY}" -lt 60 ]; then # if battery is half charged
  batteryIcon=$(echo "\uf242 ")
elif [ "${BATTERY}" -ge 60 ] && [ "${BATTERY}" -lt 95 ]; then # if battery is charged more than 60%
  batteryIcon=$(echo "\uf241 ")
else                                                          # if battery is full charged
  batteryIcon=$(echo "\uf240 ")
fi

[[ $(cat /sys/class/power_supply/BAT0/status) == "Charging" ]] && batteryIcon+=$(echo " \uf0e7")

#if hash xfce4-power-manager-settings &> /dev/null; then
#  INFO+="<txtclick>xfce4-power-manager-settings</txtclick>"     # clicking on the icon opens XFCE power manager
#fi

INFO+="<txt>"
INFO+="<span foreground=\"#101010\">" # Icon Colors
INFO+="${batteryIcon} "
INFO+="</span>"
INFO+="<span foreground=\"#101010\">" # Text Colors
INFO+="${BATTERY}%"
INFO+="</span>"
INFO+="</txt>"

TOOLTIP_INFO="<tool>"
TOOLTIP_INFO+="${NULL_VALUE}"
TOOLTIP_INFO+="</tool>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print (disabled)
echo -e "${TOOLTIP_INFO}"
