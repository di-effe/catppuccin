#!/bin/sh
#source https://github.com/x70b1/polybar-scripts
#source https://github.com/polybar/polybar-scripts

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if [ $updates_arch -gt 0 ]; then
    echo %{F#C6AAE8}   Arch: $updates_arch %{F-}
fi