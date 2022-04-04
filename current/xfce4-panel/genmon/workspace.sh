#!/bin/bash

# XFCE4 Panel GenMon script for workspaces.
# Requires xdotool.

WORKSPACE=$(xdotool get_desktop)
WORKSPACE_WINDOW_NAMES=()
for x in $(xdotool search --all --name --desktop ${WORKSPACE} ""); do
    WIN_NAME="$(xdotool getwindowname $x)"
    if [[ "${#WIN_NAME}" -gt 40 ]]; then
	WIN_NAME=$(echo "${WIN_NAME}" | cut -c -37)
	WIN_NAME+="..."
    fi
    WORKSPACE_WINDOW_NAMES+=( "${WIN_NAME}" )
done
WINDOW_ARRAY_LEN=${#WORKSPACE_WINDOW_NAMES[@]}
WINDOW_ARRAY_CURR=0
    
INFO="<txt>"
INFO+="<span foreground=\"#101010\">"
INFO+="${WORKSPACE}"
INFO+="</span>"
INFO+="</txt>"

TOOLTIP_INFO="<tool>"
for win in "${WORKSPACE_WINDOW_NAMES[@]}"; do
    WINDOW_ARRAY_CURR=$(( WINDOW_ARRAY_CURR + 1 ))
    if [[ "$WINDOW_ARRAY_CURR" -eq "$WINDOW_ARRAY_LEN" ]]; then
	TOOLTIP_INFO+="+ ${win}"
    else
	TOOLTIP_INFO+="+ ${win}\n"
    fi
done
TOOLTIP_INFO+="</tool>"

# Print Panel Item
echo -e "${INFO}"

# Print tooltip
echo -e "${TOOLTIP_INFO}"
