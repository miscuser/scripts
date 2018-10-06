#!/bin/sh

# Backup from Windows machine. 

# Command lines with and without the dry-run option.
cmd='rsync -avh --log-file="$log"'
# cmd='rsync -avh --log-file="$log" --dry-run'

# Reference folders and files.
log='/cygdrive/c/Users/main/Google Drive/logs/nightly/nightly_backup_windows.txt'
backup_drive='/cygdrive/i/'
media_drive='/cygdrive/z/'
c_drive='/cygdrive/c'

# Logging info. 
date >> $log

# Misc. local folders.
# eval $cmd \
    # --exclude-from='/home/main/scripts/backup-scripts/exclude_junk.txt' \
     # $c_drive/bin \
     # $c_drive/static \
     # /cygdrive/i/win \
     # | grep -E -v '/$'

# Media files.
eval $cmd \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_video.txt' \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_music.txt' \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_junk.txt' \
    $media_drive $backup_drive/media/ \
    | grep -E -v '/$'
