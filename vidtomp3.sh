#!/bin/bash

echo "Enter file/directory:"
read PASSED 

OUTDIR=/home/misc/Downloads

if [[ -d "$PASSED" ]]; then
    VAR="/home/misc/musicfiles.txt"
    ls "$PASSED"/*.{mp4,mkv,avi,flv} 2> /dev/null | sort > $VAR # Collect filenames in the directory
    cat $VAR | while read line; do               # Loop/read the filenames from the file
    INPUT=$(echo ${line})                        # Grab the next filename
    xpath=${INPUT%/*} 
    xbase=${INPUT##*/}
    xfext=${xbase##*.}
    xpref=${xbase%.*}
    avconv -i "$INPUT" -threads auto -vn -qscale:a 0 "$OUTDIR/$xpref.mp3"
    done
    rm $VAR                       # Remove text file with filenames
elif [[ -f "$PASSED" ]]; then
    xpath=${PASSED%/*} 
    xbase=${PASSED##*/}
    xfext=${xbase##*.}
    xpref=${xbase%.*}
    avconv -i "$PASSED" -threads auto -vn -qscale:a 0 "$OUTDIRi/$xpref.mp3"
else
    echo "$PASSED is not valid"
    exit 1
fi


