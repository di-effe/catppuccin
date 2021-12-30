#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "%{F#6E6C7E}  Off %{F-}"
else
  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
  then 
    echo "  "
  else
    echo "%{F#B7E5E6}  %{F-}"
  fi
fi