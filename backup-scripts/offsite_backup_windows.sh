#!/bin/sh

# Backup from BACKUP to OFFSITE drive. 

# Command lines with and without the dry-run option.
cmd='rsync -avh'
# cmd='rsync -avh --dry-run'

# Reference folders and files.
source='/cygdrive/z/'
offsite='/cygdrive/j/'

printf "\n--- Copying from MEDIA to OFFSITE\n"
eval $cmd \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_offsite.txt' \
    --exclude-from='/home/main/scripts/backup-scripts/exclude_junk.txt' \
     $source \
     $offsite \
     | grep -E -v '/$'
