#!/bin/bash

# XFCE4 Panel GenMon script for time.

TIME=$(echo "\uf64f ")
TIME+=`date '+%H:%M'`

INFO="<txt>"
INFO+="<span foreground=\"#101010\">"
INFO+="${TIME}"
INFO+="</span>"
INFO+="</txt>"

MORE_INFO="<tool>"
MORE_INFO+="${NULL_VALUE}"
MORE_INFO+="</tool>"

# Print Panel Item
echo -e "${INFO}"

# Print tooltip (disabled)
echo -e "${MORE_INFO}"
