#!/bin/bash
logfile=$HOME/backup/logs/rclone_gdrive.log
declare -a directories_to_backup
directories_to_backup=(dir1 dir2 dir3 dir4 dir5/photos dir6/docs/2020)

for dir in "${directories_to_backup[@]}";do
	/usr/bin/rclone copy --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s /$dir gdrive:$dir --log-file=${logfile}
done
