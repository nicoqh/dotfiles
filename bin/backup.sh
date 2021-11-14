#!/bin/bash

SpiderOakONE --batchmode

export DISPLAY=:0
/usr/bin/notify-send "Backup has run" --expire-time=30000 -i face-angel
