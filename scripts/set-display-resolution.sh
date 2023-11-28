#!/bin/bash
EXTERNAL_OUTPUT="DP-0"
INTERNAL_OUTPUT="eDP-1-1"

xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto --mode 5120x1440 --rate 120
