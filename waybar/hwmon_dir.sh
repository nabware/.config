#!/bin/bash

target_device_name=$1

for curr_device_dir in /sys/class/hwmon/hwmon*; do
    curr_device_name=$(cat "$curr_device_dir/name")
    if [[ "$curr_device_name" == $target_device_name ]]; then
        echo $curr_device_dir
        exit
    fi
done
