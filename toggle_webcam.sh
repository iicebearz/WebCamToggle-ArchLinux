#!/bin/bash

if lsmod | grep -q uvcvideo; then
    # DISABLE - unload module
    pkexec rmmod uvcvideo
    notify-send "Webcam: DISABLED" "Module unloaded"
else
    # ENABLE - load module  
    pkexec modprobe uvcvideo
    notify-send "Webcam: ENABLED" "Module loaded"
fi
