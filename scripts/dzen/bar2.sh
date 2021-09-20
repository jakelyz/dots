
#!/bin/sh

##########
# Colors #
##########

BARBG="#2c2b2a"
BARFG="#f9e7c4"
DESKACTIVEBG="#f9e7c4"
DESKACTIVEFG="#85678f"
DESKINACTIVEBG="#2c2b2a"
DESKINACTIVEFG="#ada28c"

###############
# Positioning #
###############

BARWIDTH="100"
BARHEIGHT="30"
PADDING="15"
SCREENWIDTH=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
SCREENHEIGHT=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
XPOS=$(( (( $SCREENWIDTH / 2 )) + $PADDING ))
YPOS=$( expr $SCREENHEIGHT - $BARHEIGHT - $PADDING)

#############
# Functions #
#############

time_and_bat() {
  local charge=$(cat /sys/class/power_supply/BAT0/capacity)
  echo "$(date '+%H:%M') $charge%"

}

output() {
  while sleep 1
  do
  	time_and_bat
  done
}

###############
# Execute Bar #
###############

output | dzen2 -fn "Misc Termsynu" -bg "$BARBG" -fg "$BARFG" -h $BARHEIGHT -w $BARWIDTH -x $XPOS -y $YPOS -ta c
