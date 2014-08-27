#!/usr/bin/sh

# Bash script to back up files
# Runs nightly around 3am

log=/cygdrive/c/logs/nightly_backup_log.txt

date >> $log
echo "Backup starting..." >> $log

# Video files
echo "Video files..." >> $log
rsync -avh --log-file="$log" /cygdrive/c/Videos/ /cygdrive/i/Videos/ # --dry-run

# Music (not iTunes)
echo "Music files..." >> $log
rsync -avh --log-file="$log" /cygdrive/c/Music/ /cygdrive/i/Music/ #--dry-run

# iTunes
echo "iTunes files..." >> $log
rsync -avh --log-file="$log" /cygdrive/c/iTunes/ /cygdrive/i/iTunes/ #--dry-run

# Language Documents
echo "Language documents..." >> $log
rsync -avh --log-file="$log" /cygdrive/c/Language\ Documents/ /cygdrive/i/Language\ Documents/ #--dry-run

# Language Audio
echo "Language audio..." >> $log
rsync -avh --log-file="$log" /cygdrive/c/Language\ Audio/ /cygdrive/i/Language\ Audio/ #--dry-run

# Subversion Repository
echo "Subversion repository..." >> $log
rsync -avh --log-file="$log" /cygdrive/c/svn_repository/ /cygdrive/i/svn_repository/ #--dry-run

# Chessbase files
echo "ChessBase files..." >> $log
rsync -avh --log-file="$log" /cygdrive/c/Users/main/Documents/ChessBase/ /cygdrive/i/Chess/Chessbase/ #--dry-run

# Chess - other
echo "Chess - other..." >> $log
rsync -avh --log-file="$log" /cygdrive/c/Chess/ /cygdrive/i/Chess/other/ #--dry-run

echo "Backup complete." >> $log

