#!/bin/sh

# Backup from Windows machine. 

log='/cygdrive/c/Dropbox/logs/nightly/nightly_backup_windows.txt'
localhome='/cygdrive/c/home/'
backupdrive='/cygdrive/i/'
mediadrive='/cygdrive/j/'

date >> $log
printf "Backup starting...\n" | tee -a $log

##### Files stored on computer.
printf "\n--- Windows home folder\n" | tee -a $log
rsync -avhO --log-file="$log" $localhome $backupdrive/win/home/ #--dry-run

printf "\n--- Portable apps\n" | tee -a $log
rsync -avhO --log-file="$log" /cygdrive/c/apps/ $backupdrive/win/apps #--dry-run

printf "\n--- Installation packages\n" | tee -a $log
rsync -avhO --log-file="$log" /cygdrive/c/installs/ $backupdrive/win/installs #--dry-run

printf "\n--- Windows bin folder\n" | tee -a $log
rsync -avhO --log-file="$log" /cygdrive/c/bin/ $backupdrive/win/bin #--dry-run

##### Media files stored on external drive.
printf "\n--- External (media) files\n" | tee -a $log
rsync -avhO \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_video.txt' \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_music.txt' \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_junk.txt' \
    --log-file="$log" \
    $mediadrive $backupdrive/media/ | grep -E -v '/$' #--dry-run

printf "\nBackup complete." | tee -a $log
printf "\n------------------------------------" | tee -a $log
