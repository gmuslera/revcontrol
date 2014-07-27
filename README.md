revcontrol
==========

This provides a trivial and naive way to keep track on changes of files and backup them. Is not meant to be secure, complete, efficient or not to raise false alarms, just as trivial as possible. Administering servers with other people found that need to keep track of (manual) changes done in some configuration files, where no configuration manager like puppet/chef/ansible/etc were used. so i did this, but can be used in more scenarios.

Configure email/backup directory in the start of revcontrol.sh. Then put in a file (i.e. named myfilelist) the files directories you want to track, then call revcontrol.sh myfilelist. That will generate in the backupdir a file called myfilelist.tar.gz and send a notification mail.
Sucessive calls (i.e. in a cron job) will check if some of those files are newer than the last backup, and if so will rename the old backup adding the date of change, and create a new backup, sending a notification mail with the files changed.

The command difftar.sh is a shortcut to see what files changed (and how) between 2 backup files.
