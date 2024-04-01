#!/bin/bash

# Returns total used space in GiB.
df / /boot /home --output=used \
| awk 'NR==2 {root=$1} NR==3 {boot=$1} NR==4 {home=$1}
        END {
            sum=root + boot + home;
            printf "%5.1f GiB\n", sum / 1024 / 1024
        }'
