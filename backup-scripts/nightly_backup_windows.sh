#!/bin/sh

# Backup from Windows machine. 

log='/cygdrive/c/Dropbox/logs/nightly/nightly_backup_windows.txt'
backup_drive='/cygdrive/i/'
media_drive='/cygdrive/j/'
c_drive='/cygdrive/c'

date >> $log
printf "Backup starting...\n" | tee -a $log

# Misc. Windows folders.
 rsync -av --log-file="$log" \
     $c_drive/home \
     $c_drive/apps \
     $c_drive/installs \
     $c_drive/bin \
     /cygdrive/i/win \
     | grep -E -v '/$'

##### Media files stored on external drive.
printf "\n--- External (media) files\n" | tee -a $log
rsync -av \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_video.txt' \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_music.txt' \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_junk.txt' \
    --log-file="$log" \
    $media_drive $backup_drive/media/ \
    | grep -E -v '/$' 

printf "\nBackup complete." | tee -a $log
printf "\n------------------------------------" | tee -a $log
