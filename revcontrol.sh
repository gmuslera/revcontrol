#!/bin/sh

# Use revcontrol.sh <text file with list of files/directories to check>

# Change here
mailreports="yourname@example.com"
backupdir="/my/config/backup/archives"



startprocess=`date +%Y%m%d%H%M`

if [! -f "$1" ]; then
	echo "missing/invalid parameter"
	exit 1
else
	param="$1"
fi
filename=`basename "$param"`
filelist=$(/bin/cat "$param" | tr '\n' ' ');
#echo "File list: $filelist"
if [ -f "$backupdir/$filename.tar.gz" ]; then
	newfiles=`find $filelist -newer $backupdir/$filename.tar.gz`
	if [ -n "$newfiles" ]; then
		mv $backupdir/$filename.tar.gz $backupdir/$filename-$startprocess.tar.gz
		tar cfz $backupdir/$filename.tar.gz --dereference -T $1
		echo $newfiles | mail -s "New files on $startprocess of $filename" $mailreports
	fi
else
	tar cfz $backupdir/$filename.tar.gz --dereference -T $1 
fi
