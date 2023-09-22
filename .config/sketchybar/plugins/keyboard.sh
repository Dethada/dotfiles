#!/usr/bin/env bash

SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID)

case ${SOURCE} in
'com.apple.keylayout.ABC') LABEL='A' ;;
'com.apple.keylayout.Colemak') LABEL='C' ;;
'com.apple.keylayout.Pinyin - Simplified') LABEL='P' ;;
esac

sketchybar --set $NAME label="$LABEL"
