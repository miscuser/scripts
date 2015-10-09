#!/bin/sh

# Bash script to back up files
# Runs nightly around 3am

log=~/logs/nightly_backup_log.txt

date >> $log
echo "Backup starting..." >> $log

##### Dropbox backups

# Notes folder - copy to Dropbox 
echo "Notes..." >> $log
rsync -avhO --log-file="$log" ~/Documents/notes/ ~/Dropbox/notes/ #--dry-run

# Anki - copy to Dropbox 
echo "Anki..." >> $log
rsync -avhO --exclude 'backups' --log-file="$log" ~/Documents/Anki/ ~/Dropbox/Anki/ #--dry-run

##### Files stored on computer

# Documents folder 
echo "Documents..." >> $log
rsync -avhO --log-file="$log" ~/Documents/ /media/backup/home/Documents/ #--dry-run

# Scripts folder 
echo "Scripts..." >> $log
rsync -avhO --log-file="$log" --exclude '.git' ~/scripts/ /media/backup/home/scripts/ #--dry-run

# Peronsal bin folder 
echo "Personal bin..." >> $log
rsync -avhO --log-file="$log" --exclude '.git' ~/bin/ /media/backup/home/bin/ #--dry-run

# Her files 
echo "Her files..." >> $log
rsync -avhO --log-file="$log" ~/Stacey\_documents/ /media/backup/home/Stacey\_documents/ #--dry-run

# Get some of the .dirs too
echo "Dot directories..." >> $log
rsync -avhO --log-file="$log" ~/.fonts/ /media/backup/home/.fonts #--dry-run
rsync -avhO --log-file="$log" ~/.themes/ /media/backup/home/.themes #--dry-run
rsync -avhO --log-file="$log" ~/.icons/ /media/backup/home/.icons #--dry-run
rsync -avhO --log-file="$log" ~/.ssh/ /media/backup/home/.ssh #--dry-run
rsync -avhO --log-file="$log" --exclude '.git' ~/.vim/ /media/backup/home/.vim #--dry-run

##### Files stored on external drive

# iCloud - files are dumped to the source folder when I boot into Windows
echo "iCloud files..." >> $log
rsync -avhO --log-file="$log" /media/external/iCloud/ /media/backup/media/iCloud/ #--dry-run

# Music -- ~/Music is a symlink to the external drive
echo "Music files..." >> $log
rsync -avhO --log-file="$log" ~/Music/ /media/backup/media/Music/ #--dry-run

# Video files -- ~/Videos is a symlink to the exteranl drive
echo "Video files..." >> $log
rsync -avhO --exclude 'Temp' --exclude '!Missed' --exclude 'Never Watched' --exclude 'Fastlane' --log-file="$log" ~/Videos/ /media/backup/media/Videos/ #--dry-run

# Pictures
echo "Pictures..." >> $log
rsync -avhO --log-file="$log" /media/external/pictures/ /media/backup/media/pictures/ #--dry-run

# Language files 
echo "Language files..." >> $log
rsync -avhO --log-file="$log" /media/external/Language/ /media/backup/media/Language/ #--dry-run

# Audio - Learning 
echo "Audio - Learning files..." >> $log
rsync -avhO --log-file="$log" /media/external/Audio\ -\ Learning/ /media/backup/media/Audio\ -\ Learning/ #--dry-run

echo "Backup complete." >> $log

