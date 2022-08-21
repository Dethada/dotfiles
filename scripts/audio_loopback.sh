#!/bin/bash

# list audio device names
sox -V6 -n -t coreaudio junkname

# start the loopback
sox -t coreaudio 'Scarlet 2i2' -t coreaudio 'Audioengine '
