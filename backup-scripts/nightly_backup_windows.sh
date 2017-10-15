#!/bin/sh

# Backup from Windows machine. 

# Command lines with and without the dry-run option.
cmd='rsync -avh --log-file="$log"'
# cmd='rsync -avh --log-file="$log" --dry-run'

# Reference folders and files.
log='/cygdrive/c/Dropbox/logs/nightly/nightly_backup_windows.txt'
backup_drive='/cygdrive/i/'
media_drive='/cygdrive/j/'
c_drive='/cygdrive/c'

# Logging info. 
date >> $log
printf "Backup starting...\n" | tee -a $log

# Misc. Windows folders.
printf "\n--- Various Windows folders\n" | tee -a $log
eval $cmd \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_junk.txt' \
     $c_drive/home \
     $c_drive/apps \
     $c_drive/installs \
     $c_drive/bin \
     $c_drive/static \
     $c_drive/shortcuts \
     $c_drive/Dropbox \
     $c_drive/whip \
     /cygdrive/i/win \
     | grep -E -v '/$'

# Media files stored on external drive.
printf "\n--- External (media) files\n" | tee -a $log
eval $cmd \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_video.txt' \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_music.txt' \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_junk.txt' \
    $media_drive $backup_drive/media/ \
    | grep -E -v '/$'

printf "\nBackup complete." | tee -a $log
printf "\n------------------------------------" | tee -a $log
