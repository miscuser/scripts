#!/bin/sh

# Backup from BACKUP to OFFSITE drive. 

# Command lines with and without the dry-run option.
cmd='rsync -avh'
# cmd='rsync -avh --dry-run'

# Reference folders and files.
backup_drive='/cygdrive/i/'
offsite_drive='/cygdrive/z/'

printf "\n--- Copying from BACKUP to OFFSITE\n"
eval $cmd \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_offsite.txt' \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_junk.txt' \
     $backup_drive \
     $offsite_drive \
     | grep -E -v '/$'
