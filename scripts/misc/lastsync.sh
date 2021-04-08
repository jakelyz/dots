#!/bin/sh

SECONDS_DAY=86400
SECONDS_HOUR=3600
SECONDS_MINUTE=60

CURRENT_TIME=$(date +'%a, %d %b %Y %H:%M:%S')
PORTAGE_TIME=$(cat /var/db/repos/gentoo/metadata/timestamp.chk)

function unixtime() {
  echo $(date +%s -d "$1")
}

function timecalc() {
  echo "$(( ($1 - $2) / $3 ))"
}

UNIX_CURRENT=$(unixtime "$CURRENT_TIME")
UNIX_PORTAGE=$(unixtime "$PORTAGE_TIME")

DIFF_DAYS=$(timecalc "$UNIX_CURRENT" "$UNIX_PORTAGE" "$SECONDS_DAY")
DIFF_HOURS=$(timecalc "$UNIX_CURRENT" "$UNIX_PORTAGE" "$SECONDS_HOUR")
DIFF_MINUTE=$(timecalc "$UNIX_CURRENT" "$UNIX_PORTAGE" "$SECONDS_MINUTE")

if [ $DIFF_DAYS -gt 0 ]; then
  echo "${DIFF_DAYS}d"
  exit
elif [ $DIFF_HOURS -gt 0 ]; then
  echo "${DIFF_HOURS}h"
  exit
else
  echo "${DIFF_MINUTE}m"
  exit
fi
