#!/bin/sh

# Backup from Windows machine. 

log='/cygdrive/c/Dropbox/logs/nightly/nightly_backup_windows.txt'
backupdrive='/cygdrive/i/'

date >> $log
printf "Backup starting...\n" | tee -a $log

##### Files stored on computer.
# Home folder 
printf "\n--- Windows home folder\n" >> $log
rsync -avhO --log-file="$log" /cygdrive/c/home/ $backupdrive/home/ #--dry-run

##### Files stored on external drive.
# Music -- ~/Music is a symlink to the external drive.
printf "\n--- Music files\n" | tee -a $log
rsync -avhO --exclude-from='/home/main/scripts/backup-scripts/exclude_music.txt' --log-file="$log" ~/Music/ $backupdrive/media/Music/  | grep -E -v '/$' #--dry-run

# Video files -- ~/Videos is a symlink to the exteranl drive.
printf "\n--- Video files\n" | tee -a $log
rsync -avhO --exclude-from='/home/main/scripts/backup-scripts/exclude_video.txt' --log-file="$log" ~/Videos/ $backupdrive/media/Videos/  | grep -E -v '/$' #--dry-run

# Pictures
# echo "Pictures..." >> $log
# rsync -avhO --log-file="$log" /media/external/pictures/ /media/backup/media/pictures/ #--dry-run

printf "\nBackup complete." | tee -a $log
printf "\n------------------------------------" | tee -a $log
