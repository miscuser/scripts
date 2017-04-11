#!/bin/sh

# Bash script to back up files
# Runs nightly around 3am

log='/cygdrive/c/Dropbox/logs/nightly/nightly_backup_windows.txt'
backupdrive='/cygdrive/i/'

date >> $log
printf "Backup starting...\n" | tee -a $log

##### Files stored on computer

# Home folder 
printf "\n--- Windows home folder\n" >> $log
rsync -avhO --log-file="$log" /cygdrive/c/home/ $backupdrive/home/ #--dry-run

# The woman's files. 
# echo "Her files..." >> $log
# rsync -avhO --log-file="$log" ~/Stacey\_documents/ /media/backup/home/Stacey\_documents/ #--dry-run

# Get some of the .dirs too
# echo "Dot directories..." >> $log
# rsync -avhO --log-file="$log" --exclude '.git' ~/.vim/ /media/backup/home/.vim #--dry-run

##### Files stored on external drive

# Music -- ~/Music is a symlink to the external drive
printf "\n--- Music files\n" | tee -a $log
rsync -avhO --exclude-from='exclude_music.txt' --log-file="$log" ~/Music/ $backupdrive/media/Music/  | grep -E -v '/$' #--dry-run

# Video files -- ~/Videos is a symlink to the exteranl drive
printf "\n--- Video files\n" | tee -a $log
rsync -avhO --exclude-from='exclude_video.txt' --log-file="$log" ~/Videos/ $backupdrive/media/Videos/  | grep -E -v '/$' #--dry-run

# Pictures
# echo "Pictures..." >> $log
# rsync -avhO --log-file="$log" /media/external/pictures/ /media/backup/media/pictures/ #--dry-run

printf "\nBackup complete." | tee -a $log
printf "\n------------------------------------" | tee -a $log
