#!/bin/bash
engine=$(ibus engine)

ENGLISH="xkb:us::eng"
VIETNAM="Bamboo"
if [[ "$engine" == "$ENGLISH" ]]; then
    notify-send "V"
    ibus engine $VIETNAM
else
    notify-send "E"
    ibus engine $ENGLISH
fi