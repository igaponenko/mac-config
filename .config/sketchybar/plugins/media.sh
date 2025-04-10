#!/bin/bash
STATE="$(echo "$INFO" | jq -r '.state')"

MEDIA="$(echo "$INFO" | jq -r '.artist + " - " + .title')"
if [ "$(echo "$INFO" | jq -r '.artist')" = "null" ] || [ -z "$(echo "$INFO" | jq -r '.artist')" ]; then
    MEDIA="$(echo "$INFO" | jq -r '.title')"
fi

if [ "${#MEDIA}" -gt 25 ]; then
    MEDIA="$(echo "$MEDIA" | cut -c 1-25)..."
fi

MEDIA="$(echo "$MEDIA" | tr '[:upper:]' '[:lower:]')"

if [ "$STATE" = "playing" ]; then
    # MEDIA="$(echo "$INFO" | jq -r '.title + " - " + .artist')"
    sketchybar --set $NAME icon="􀊘" label="$MEDIA" drawing=on
elif [ "$STATE" = "paused" ]; then
    # MEDIA="$(echo "$INFO" | jq -r '.title + " - " + .artist')"
    sketchybar --set $NAME icon="􀊖" label="$MEDIA" scroll_texts=off drawing=on
    start=$SECONDS
    while [ $((SECONDS - start)) -lt 60 ]; do
        STATE="$(echo "$INFO" | jq -r '.state')"
        if [ "$STATE" = "playing" ]; then
            break
        fi
        sleep 1
    done
    if [ "$STATE" = "paused" ]; then
        sketchybar --set $NAME drawing=off
    fi
fi
