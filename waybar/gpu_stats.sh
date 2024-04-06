#!/bin/bash

util=$(
    awk '{printf "%3d", $1}' \
    /sys/class/hwmon/hwmon4/device/gpu_busy_percent
)

freq=$(
    awk '{printf "%4.2f", $1 / 1000000000}' \
    /sys/class/hwmon/hwmon4/freq1_input
)

vram=$(
    awk '{printf "%4.1f", $1 / 1024 / 1024 / 1024}' \
    /sys/class/drm/card1/device/mem_info_vram_used
)

tedge=$(
    awk '{printf "%2d", $1 / 1000}' \
    /sys/class/hwmon/hwmon4/temp1_input
)

tjunc=$(
    awk '{printf "%2d", $1 / 1000}' \
    /sys/class/hwmon/hwmon4/temp2_input
)

power=$(
    awk '{printf "%3d", $1 / 1000000}' \
    /sys/class/hwmon/hwmon4/power1_average
)

echo "$util% | $freq GHz | $tedge°C ($tjunc) | $power W | $vram GiB"
