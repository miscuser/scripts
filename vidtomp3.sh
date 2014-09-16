#!/bin/bash

echo "Enter file/directory:"
read PASSED 
#PASSED=$1

if [[ -d $PASSED ]]; then
    # --- This works but leaves the files in the source directory so I changed it.
    #VAR="/home/misc/musicfiles.txt"
    #ls $PASSED/*.{mp4,mkv,avi,flv} | sort > $VAR # Collect filenames in the directory
    #cat $VAR | while read line; do  # Loop/read the filenames from the file
    #INPUT=$(echo ${line})         # Grab the next filename
    #OUTPUT=${INPUT%.*}            # Remove file extension (works on most files)
    #OUTPUT+=".mp3"                # Append new extension
    #avconv -i "$INPUT" -qscale:a 0 "$OUTPUT"
    #done
    #rm $VAR                       # Remove text file with filenames

    VAR="/home/misc/musicfiles.txt"
    ls $PASSED/*.{mp4,mkv,avi,flv} | sort > $VAR # Collect filenames in the directory
    cat $VAR | while read line; do               # Loop/read the filenames from the file
    INPUT=$(echo ${line})                        # Grab the next filename
    xpath=${INPUT%/*} 
    xbase=${INPUT##*/}
    xfext=${xbase##*.}
    xpref=${xbase%.*}
    avconv -i "$INPUT" -threads auto -qscale:a 0 "/home/misc/Downloads/$xpref.mp3"
    done
    rm $VAR                       # Remove text file with filenames
elif [[ -f $PASSED ]]; then
    xpath=${PASSED%/*} 
    xbase=${PASSED##*/}
    xfext=${xbase##*.}
    xpref=${xbase%.*}
    avconv -i "$PASSED" -threads auto -qscale:a 0 "/home/misc/Downloads/$xpref.mp3"
else
    echo "$PASSED is not valid"
    exit 1
fi


