#!/bin/bash

# XFCE4 Panel GenMon script for pulseaudio.
# Requires pamixer

VOLUME=$(pamixer --get-volume-human)

INFO="<txt>"
INFO+="<span foreground=\"#101010\">"

if [[ "${VOLUME}" != "muted" ]]; then
    VOL_ICON=$(echo "\ufa7d")
    INFO+="${VOL_ICON} ${VOLUME}"
else
    VOL_ICON=$(echo "\ufa80")
    INFO+="${VOL_ICON}"
fi

INFO+="</span>"
INFO+="</txt>"

TOOLTIP_INFO="<tool>"
TOOLTIP_INFO+="${NULL_VALUE}"
TOOLTIP_INFO+="</tool>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print (disabled)
echo -e "${TOOLTIP_INFO}"
