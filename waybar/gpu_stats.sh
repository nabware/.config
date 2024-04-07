#!/bin/bash

hwmon_dir=$($HOME/.config/waybar/hwmon_dir.sh amdgpu)

if [[ "$?" != 0 ]]; then
    exit 1
elif [[ "$hwmon_dir" == "" ]]; then
    echo "GPU hwmon dir not found"
    exit 1
fi

util=$(awk '{printf "%3d", $1}' $hwmon_dir/device/gpu_busy_percent)
freq=$(awk '{printf "%4.2f", $1 / 1000000000}' $hwmon_dir/freq1_input)
tedge=$(awk '{printf "%2d", $1 / 1000}' $hwmon_dir/temp1_input)
tjunc=$(awk '{printf "%2d", $1 / 1000}' $hwmon_dir/temp2_input)
power=$(awk '{printf "%3d", $1 / 1000000}' $hwmon_dir/power1_average)
vram=$(
    awk '{printf "%4.1f", $1 / 1024**3}' \
    $hwmon_dir/device/mem_info_vram_used
)

echo "$util% | $freq GHz | $tedge°C ($tjunc) | $power W | $vram GiB"
