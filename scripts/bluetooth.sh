#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "%{F#757575}  Off %{F-}"
else
  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
  then 
    echo "  "
  else
    echo "%{F#e5b4e2}  %{F-}"
  fi
fi