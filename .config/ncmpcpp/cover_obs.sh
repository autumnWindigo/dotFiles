#!/bin/bash

COVER="/tmp/album_cover.png"
COVER_SIZE="850"

file=$(mpc --format %file% current)
file2=${file%.*}; file2=${file2}.jpg
art=$file2; art=~/music/${art}


if [ "$art" = "" ]; then
  art="$HOME/.config/ncmpcpp/default_cover.png"
fi

ffmpeg -loglevel 0 -y -i "$art" -vf "scale=$COVER_SIZE:-1" "$COVER"
