#!/bin/bash
# used for backing up the configuration files and other stuff to a remote server


Volume="/Volumes/cloudnet/"
mainbackup=$(pwd)/servers.txt
while read mainbackup; do
    ip=$(echo $mainbackup | cut -d "-" -f 1)
    username=$(echo $mainbackup | cut -d "-" -f 2)
    # rsync -av /Users/admin/backup-sh/ $username@$ip:$Volume
  
done <$mainbackup




