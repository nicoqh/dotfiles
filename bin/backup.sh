#!/bin/bash

DATE=`date '+%Y-%m-%d %H:%M'`

echo "$DATE: Starting ..." >> /home/nico/backup.log

SpiderOakONE --batchmode >> /home/nico/backup.log

export DISPLAY=:0
/usr/bin/notify-send "Backup has run" --expire-time=30000 -i face-angel
