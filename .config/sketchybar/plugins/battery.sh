#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"
TIME_LEFT=$(pmset -g batt | grep -Eo "\d+:\d+")

#if [ "$PERCENTAGE" = "" ]; then
#  exit 0
#fi

# case "${PERCENTAGE}" in
# 9[0-9] | 100)
#   ICON="􀛨"
#   ;;
# [6-8][0-9])
#   ICON="􀺸"
#   ;;
# [3-5][0-9])
#   ICON="􀺶"
#   ;;
# [1-3][0-9])
#   ICON="􀛩"
#   ;;
# *) ICON="􀛪" ;;
# esac

# if [[ "$CHARGING" != "" ]]; then
#   ICON="􀢋"
# fi
if [[ -z $TIME_LEFT ]]; then
  echo "Remaining time: $TIME_LEFT"
  TIME_LABEL=""
else
  HOURS=$(echo "$TIME_LEFT" | cut -d: -f1)
  MINUTES=$(echo "$TIME_LEFT" | cut -d: -f2)
  if [[ $HOURS -eq 0 ]]; then
    TIME_LABEL="${MINUTES}"
    if [[ $MINUTES -eq 0 ]]; then
      TIME_LABEL=""
    fi
  else
    TIME_LABEL="${HOURS}:${MINUTES}"
  fi
fi
# else
#   HOURS=$(echo "$TIME_LEFT" | cut -d: -f1)
#   MINUTES=$(echo "$TIME_LEFT" | cut -d: -f2)
#   TIME_LABEL="${HOURS}h${MINUTES}min"
# fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
# sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
# sketchybar --set "$NAME" icon="$ICON" label="${TIME_LABEL}"
sketchybar --set "$NAME" icon="" label="${TIME_LABEL}"
