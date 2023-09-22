#!/usr/bin/env bash

SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep -m1 "Input Mode" | cut -d'"' -f4)

LABEL='A'
case ${SOURCE} in
'com.apple.inputmethod.SCIM.WBX') LABEL='五' ;;
'com.apple.inputmethod.SCIM.ITABC') LABEL='拼' ;;
esac

sketchybar --set $NAME label="$LABEL"
