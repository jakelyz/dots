#!/bin/sh

_PKGSRCDB="/home/jlyz/usr/pkgdb/"

cat << EOB
--------------------------------------------------
	pkgsrc no "REQUIRED_BY" results
--------------------------------------------------
EOB

for pkg in `ls $_PKGSRCDB`; do
  if ! [ -f "$_PKGSRCDB/$pkg/+REQUIRED_BY" ]; then
    echo " $pkg"
  fi
done
