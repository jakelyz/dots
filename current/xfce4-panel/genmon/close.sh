#!/bin/bash

# XFCE4 genmon script for closing the active window
# Requires xdotool

WINDOW_TITLE=$(xdotool getactivewindow getwindowname)

INFO="<txt>"
INFO+="<span weight='Regular' fgcolor='White'>" 
if [ "${WINDOW_TITLE}" != "Desktop" ]; then # hide the close button when the active window becomes Desktop
    INFO+=""
else
    INFO+=""
fi
INFO+="</span>"
INFO+="</txt>"
if [ "${WINDOW_TITLE}" != "Desktop" ]; then
 INFO+="<txtclick>xdotool windowkill `xdotool getactivewindow`</txtclick>"
fi
echo -e "${INFO}"

MORE_INFO="<tool>"
MORE_INFO+="${NULL_VALUE}" #just to hide the tooltip
MORE_INFO+="</tool>"

echo -e "${MORE_INFO}"
