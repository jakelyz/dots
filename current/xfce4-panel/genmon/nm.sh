#!/bin/bash

# XFCE4 Panel GenMon script for network manager.
# Requires nmcli

INTERFACE="wlan0"
CONNCHECK=$(nmcli -f GENERAL.STATE device show "${INTERFACE}" | awk -F " " '{print $3}')

if [[ "${CONNCHECK}" == "(connected)" ]]; then
    WIFI_ICON=$(echo "\ufaa8")
    SSID=$(nmcli -f GENERAL.CONNECTION device show "${INTERFACE}" | awk -F " " '{print $2}')
else
    WIFI_ICON=$(echo "\ufaa9")
    SSID="None"
fi

INFO="<txt>"
INFO+="<span foreground=\"#101010\">"
INFO+="${WIFI_ICON} ${SSID}"
INFO+="</span>"
INFO+="</txt>"

TOOLTIP_INFO="<tool>"
TOOLTIP_INFO+="${NULL_VALUE}"
TOOLTIP_INFO+="</tool>"

# Print Panel item
echo -e "${INFO}"

# Print tooltip
echo -e "${TOOLTIP_INFO}"
