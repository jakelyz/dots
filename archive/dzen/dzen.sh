#!/bin/sh

BARBG="#2a1f1d"
BARFG="#e0dbb7"

PADDING="5"
BARHEIGHT="18"
SCREENWIDTH=$(xrandr --current | grep '*' | awk '{print $1}' | cut -dx -f1)
BARWIDTH="$( expr $SCREENWIDTH - `expr $PADDING \* 2` )"
XPOS=$( expr 0 + $PADDING )
YPOS=$( expr 0 + $PADDING )

_status() {
  printf "%s -- %s -- %s\n" \
$(date +'%b.%d %H:%M') \
$(acpiconf -i batt# | grep 'Remaining capacity' | awk '{print $3}')
}

output() {
  while true
  do
	_status
	sleep 45
  done
}

output | dzen2 -fn "PxPlus IBM EGA 8x14:style=Regular:pixelsize=16" -bg "$BARBG" -fg "$BARFG" -h $BARHEIGHT -w $BARWIDTH -x $XPOS -y $YPOS -ta c
