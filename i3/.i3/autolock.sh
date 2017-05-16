#!/usr/bin/sh
xautolock -detectsleep -corners +0-0 -time 10 -locker '~/.i3/blur.sh' -killtime 15 -killer 'systemctl suspend'
