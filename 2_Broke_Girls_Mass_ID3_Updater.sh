#!/bin/bash
# A wrapper for the 2 Broke Girls Updater

echo "Enter file/directory:"
read PASSED 

if [[ -d "$PASSED" ]]; then
    shopt -s nullglob
    for f in "$PASSED"/*.mp3
    do
        /home/misc/scripts/2_Broke_Girls_ID3_Updater.py "$f" 
    done
elif [[ -f "$PASSED" ]]; then
    /home/misc/scripts/2_Broke_Girls_ID3_Updater.py "$PASSED"
else
    echo "$PASSED is not valid"
    exit 1
fi

