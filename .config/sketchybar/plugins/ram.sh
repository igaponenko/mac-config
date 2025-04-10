#!/bin/bash
PERCENTAGE=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{ printf("%d\n", 100-$5) }')

sketchybar -m --set $NAME label="$PERCENTAGE%"
