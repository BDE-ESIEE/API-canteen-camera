#!/bin/bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

echo "Saving file to: $1"

raspistill --width 1080 --height 720 -q 80 -o - | convert - -blur 0x8 -pointsize 30 -fill white -annotate +30+30 "$(date +"%D %T")" $1
