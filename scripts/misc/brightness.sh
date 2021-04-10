#!/bin/sh

BACKLIGHT_PATH="/sys/class/backlight/intel_backlight"
MAX_BRIGHTNESS=$(cat $BACKLIGHT_PATH/max_brightness)
CURRENT_BRIGHTNESS=$(cat $BACKLIGHT_PATH/brightness)


adjust_brightness() {
    [ "$2" == "increase" ] && local OPER="+"
    [ "$2" == "decrease" ] && local OPER="-"

    local increment=$(( $MAX_BRIGHTNESS*$1/100 ))
    local newbrightness=$(( $CURRENT_BRIGHTNESS$OPER$increment ))

    if [ $newbrightness -gt $MAX_BRIGHTNESS ]; then
	local newbrightness=$MAX_BRIGHTNESS
    elif [ $newbrightness -lt 0 ]; then
	local newbrightness=1
    fi

    echo "$newbrightness" | tee $BACKLIGHT_PATH/brightness

}

current_brightness() {
    awk -v curr=$CURRENT_BRIGHTNESS -v max=$MAX_BRIGHTNESS 'BEGIN {printf "%.f%\n",(curr/max*100)}'

}

while getopts "i:f:c" opt; do
    case "${opt}" in
	i)
	    inc=${OPTARG} ;;
	f)
	    func=${OPTARG} ;;
	c)
	    current_brightness ;;
    esac
done

if [ -n "$inc" ] && [ -n "$func" ]; then
    adjust_brightness "${inc}" "${func}"
fi
