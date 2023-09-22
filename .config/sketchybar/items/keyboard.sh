#!/bin/bash

sketchybar --add       event              input_change 'AppleSelectedInputSourcesChangedNotification' \
           --add       item               keyboard right                                              \
           --set       keyboard           script="$PLUGIN_DIR/keyboard.sh"                            \
                                          width=44                                                    \
                                          label.font="$FONT:Bold:14.0"                      \
           --subscribe keyboard           input_change
