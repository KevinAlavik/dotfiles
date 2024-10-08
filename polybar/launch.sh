#!/bin/bash

killall -q polybar

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload bar 2>&1 | tee -a /tmp/polybar.log &
done

echo "Polybar launched..."
