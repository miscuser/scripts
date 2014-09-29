#!/bin/sh

# Bash script to back up files
# Runs nightly around 3am

log=~/logs/nightly_backup_log.txt

date >> $log
echo "Backup starting..." >> $log

##### Files stored on computer

# Documents folder 
echo "Finance files..." >> $log
rsync -avhO --log-file="$log" ~/Documents/ /media/backup/home/Documents/ #--dry-run

# Language files 
echo "Language files..." >> $log
rsync -avhO --log-file="$log" ~/Language/ /media/backup/home/Language/ #--dry-run

# Stacey's files 
echo "Stacey's files..." >> $log
rsync -avhO --log-file="$log" ~/Stacey\_documents/ /media/backup/home/Stacey\_documents/ #--dry-run

# Get some of the .dirs too
echo "Dot directories..." >> $log
rsync -avhO --log-file="$log" ~/.fonts/ /media/backup/home/.fonts #--dry-run
rsync -avhO --log-file="$log" ~/.themes/ /media/backup/home/.themes #--dry-run
rsync -avhO --log-file="$log" ~/.icons/ /media/backup/home/.icons #--dry-run
rsync -avhO --log-file="$log" ~/.ssh/ /media/backup/home/.ssh #--dry-run

##### Files stored on external drive

# Music -- ~/Music is a symlink to the external drive
echo "Music files..." >> $log
rsync -avhO --log-file="$log" ~/Music/ /media/backup/Music/ #--dry-run

# Video files -- ~/Videos is a symlink to the exteranl drive
echo "Video files..." >> $log
rsync -avhO --log-file="$log" ~/Videos/ /media/backup/Videos/ #--dry-run

# Pictures
echo "Pictures..." >> $log
rsync -avhO --log-file="$log" /media/external/pictures/ /media/backup/pictures/ #--dry-run

# Subversion Repository
# echo "Subversion repository..." >> $log
# rsync -avhO --log-file="$log" /cygdrive/c/svn_repository/ /cygdrive/i/svn_repository/ #--dry-run
 
# Chessbase files
# echo "ChessBase files..." >> $log
# rsync -avhO --log-file="$log" /cygdrive/c/Users/main/Documents/ChessBase/ /cygdrive/i/Chess/Chessbase/ #--dry-run
 
# Chess - other
# echo "Chess - other..." >> $log
# rsync -avhO --log-file="$log" /cygdrive/c/Chess/ /cygdrive/i/Chess/other/ #--dry-run
 
echo "Backup complete." >> $log

