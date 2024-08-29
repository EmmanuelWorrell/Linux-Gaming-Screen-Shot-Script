#!/bin/bash
outdir="$HOME/Pictures/Screenshots"
mkdir -p "$outdir" 2>/dev/null

# Get the active window's name
appname="$(DISPLAY=:0 xdotool getactivewindow getwindowname 2>/dev/null)"
appname="${appname:0:32}" # Limit the appname string to 32 characters

# Take a screenshot
scrot --silent -c "${outdir}/${appname}-$(date +'%Y-%m-%d--%H%M%S').png"

# Create a subdirectory for the app if it doesn't exist
mkdir -p "${outdir}/${appname}" 2>/dev/null

# Move all screenshots to the app's subdirectory
for file in "${outdir}"/*.png; do
    if [[ "$file" == "${outdir}/${appname}-"* ]]; then
        mv "$file" "${outdir}/${appname}/"
    fi
done

