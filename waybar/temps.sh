#!/bin/bash

cpu_die=$(
    awk '{printf "%2d", $1 / 1000}' \
    /sys/class/hwmon/hwmon2/temp3_input
)

cpu_junc=$(
    awk '{printf "%2d", $1 / 1000}' \
    /sys/class/hwmon/hwmon2/temp1_input
)

gpu_edge=$(
    awk '{printf "%2d", $1 / 1000}' \
    /sys/class/hwmon/hwmon4/temp1_input
)

gpu_junc=$(
    awk '{printf "%2d", $1 / 1000}' \
    /sys/class/hwmon/hwmon4/temp2_input
)

echo "$gpu_edge°C ($gpu_junc) | $cpu_die°C ($cpu_junc)"
