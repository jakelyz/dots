#!/bin/bash

# XFCE4 Panel GenMon script for window titles.
# Requires xdotool.

WINDOW_TITLE=$(xdotool getactivewindow getwindowname)
if [[ "${#WINDOW_TITLE}" -gt 40 ]]; then
    WINDOW_TITLE=$(echo "${WINDOW_TITLE}" | cut -c -37)
    WINDOW_TITLE+="..."
fi

INFO="<txt>"
INFO+="<span foreground=\"#101010\">"
INFO+="${WINDOW_TITLE}"
INFO+="</span>"
INFO+="</txt>"

TOOLTIP_INFO="<tool>${NULL_VALUE}</tool>"

# Print Panel Item
echo -e "${INFO}"

# Print tooltip (disabled)
echo -e "${TOOLTIP_INFO}"
