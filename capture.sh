#!/bin/bash

# Script called to capture an image, blur it, add a timestamp annotation (on
# the image) and save it to the first arguments passed to the script.
#
# This script is mainly called from the crontab so depending on where you put
# it on the system, you may want to adjust the path in the crontab file.
#
#   -- M.

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# Thanks to this and `set -u` above, the entire script will fail if no argument
# is given to this script.
echo "Saving file to: $1"

# http://www.imagemagick.org/Usage/blur/#blur
raspistill --width 1080 --height 720 -q 80 -o - | convert - -blur 0x8 -pointsize 30 -fill white -annotate +30+30 "$(date +"%D - %T")" "$1"
