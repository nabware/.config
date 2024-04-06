#!/bin/bash

tdie=$(
    awk '{printf "%2d", $1 / 1000}' \
    /sys/class/hwmon/hwmon2/temp3_input
)

tjunc=$(
    awk '{printf "%2d", $1 / 1000}' \
    /sys/class/hwmon/hwmon2/temp1_input
)

echo "$tdie°C ($tjunc)"
