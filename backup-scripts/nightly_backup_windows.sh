#!/bin/sh

# Bash script to back up files
# Runs nightly around 3am

log='/cygdrive/c/Dropbox/logs/nightly/nightly_backup_windows.txt'
backupdrive='/cygdrive/i/'

date >> $log
echo "Backup starting..." | tee -a $log

##### Files stored on computer

# Documents folder 
# echo "Documents..." >> $log
# rsync -avhO --log-file="$log" ~/Documents/ /media/backup/home/Documents/ #--dry-run

# The woman's files. 
# echo "Her files..." >> $log
# rsync -avhO --log-file="$log" ~/Stacey\_documents/ /media/backup/home/Stacey\_documents/ #--dry-run

# Get some of the .dirs too
# echo "Dot directories..." >> $log
# rsync -avhO --log-file="$log" --exclude '.git' ~/.vim/ /media/backup/home/.vim #--dry-run

##### Files stored on external drive

# Music -- ~/Music is a symlink to the external drive
echo "\n--- Music files\n" | tee -a $log
rsync -avhO --exclude-from='/home/main/scripts/backup-scripts/exclude_music.txt' --log-file="$log" ~/Music/ $backupdrive/media/Music/ #--dry-run

# Video files -- ~/Videos is a symlink to the exteranl drive
echo "\n--- Video files\n" | tee -a $log
rsync -avhO --exclude-from='/home/main/scripts/backup-scripts/exclude_video.txt' --log-file="$log" ~/Videos/ $backupdrive/media/Videos/ #--dry-run

# Pictures
# echo "Pictures..." >> $log
# rsync -avhO --log-file="$log" /media/external/pictures/ /media/backup/media/pictures/ #--dry-run

echo "\nBackup complete." | tee -a $log
echo "\n------------------------------------" | tee -a $log
