#!/bin/bash

echo "Setting up init"
git init

echo "Setting up Git Ignore"
echo -e "auto_backup.sh\nerror_log.txt\noutput_log.txt"  > .gitignore

echo "Copying Auto Backup"
cp /home/ninja/GIT_INIT/auto_backup.sh .

echo "Setting Up Crontab"
wd=$(pwd)
echo "0 8-18 * * 1-5 cd $wd && ./auto_backup.sh > output_log.txt 2> $wd/error_log.txt" >> /tmp/crontab.NsfpWv/crontab

echo "Make sure to setup the remote github connection"
