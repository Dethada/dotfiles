#!/bin/sh
vwmare-user-suid-wrapper &
xsetroot -cursor_name left_ptr
exec bspwm
