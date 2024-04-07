#!/bin/bash

hwmon_dir=$($HOME/.config/waybar/hwmon_dir.sh k10temp)

if [[ "$?" != 0 ]]; then
    exit 1
elif [[ "$hwmon_dir" == "" ]]; then
    echo "CPU hwmon dir not found"
    exit 1
fi

tdie=$(awk '{printf "%2d", $1 / 1000}' $hwmon_dir/temp3_input)
tjunc=$(awk '{printf "%2d", $1 / 1000}' $hwmon_dir/temp1_input)

echo "$tdie°C ($tjunc)"
