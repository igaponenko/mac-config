#!/bin/bash

#!/bin/bash

PERCENTAGE=$(top -l 2 | grep -E "^CPU" | tail -1 | awk '{ printf "%.0f%%", $3 + $5 }')
sketchybar -m --set "$NAME" label="$PERCENTAGE"