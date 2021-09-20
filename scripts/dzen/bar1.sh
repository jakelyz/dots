
#!/bin/sh

##########
# Colors #
##########

BARBG="#2c2b2a"
BARFG="#f9e7c4"
DESKACTIVEFG="#f9e7c4"
DESKINACTIVEFG="#ada28c"

###############
# Positioning #
###############

BARWIDTH="100"
BARHEIGHT="30"
PADDING="15"
SCREENWIDTH=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
SCREENHEIGHT=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
XPOS=$(( (( $SCREENWIDTH / 2 )) - $BARWIDTH - $PADDING))
YPOS=$( expr $SCREENHEIGHT - $BARHEIGHT - $PADDING)

#############
# Functions #
#############

desktops() {
  local desktop=$(xprop -root _NET_CURRENT_DESKTOP | sed -e 's/_NET_CURRENT_DESKTOP(CARDINAL) = //')
  local desknames=( ["0"]="dev" ["1"]="web" ["2"]="vm" )
  local deskout=" "
  
  for num in "${!desknames[@]}"; do
    if [ $num -eq $desktop ]; then
      deskout="$deskout ^fg($DESKACTIVEFG)${desknames[$num]} "
    else
      deskout="$deskout ^fg($DESKINACTIVEFG)${desknames[$num]} "
    fi
  done

  echo $deskout
}

output() {
  while sleep 1
  do
  	  desktops
  done
}

###############
# Execute Bar #
###############

output | dzen2 -fn "Misc Termsynu" -bg "$BARBG" -fg "$BARFG" -h $BARHEIGHT -w $BARWIDTH -x $XPOS -y $YPOS -ta c
