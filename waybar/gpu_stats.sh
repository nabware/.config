#!/bin/bash

gpu_util=$(cat /sys/class/drm/card1/device/gpu_busy_percent | printf "%3d")

gpu_freq=$(
    awk 'NR==2 {printf "%.2f", substr($2, 1, length($2) - 3) / 1000}' \
    /sys/class/drm/card1/device/pp_dpm_sclk
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

echo "$gpu_util% | $gpu_freq GHz | $tedge°C ($tjunc) | $power W | $vram GiB"
