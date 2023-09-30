#!/bin/bash
outdir="$HOME/Pictures/Screenshots";
mkdir -p "$outdir" 2>/dev/null;
appname="$(DISPLAY=:0 xdotool getactivewindow getwindowname 2>/dev/null)";
appname="${appname:0:32}" # this line limits the appname string to 32 characters
scrot --silent -c "${outdir}/${appname}-$(date +'%Y-%m-%d--%H%M%S').png";
mkdir -p "${outdir}/${appname}" 2>/dev/null;
mv "${outdir}/${appname}-$(date +'%Y-%m-%d--%H%M%S').png" "${outdir}/${appname}/${appname}-$(date +'%Y-%m-%d--%H%M%S').png"

