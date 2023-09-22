#!/bin/bash

calendar=(
  # icon=cal
  icon.font="$FONT:Bold:14.0"
  icon.padding_right=10
  label.font="$FONT:Bold:14.0"
  label.width=45
  label.align=right
  padding_left=15
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
