#!/bin/bash

# Joseph Harriott http://momentary.eu/ Last updated: mar. 16 déc. 2014

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------
#   As this script performs a high-impact operation,
#   I prefer to leave it without executable permission
#   and call it from a terminal with the bash command.

echo "This BASH script will run rsync, pushing all changes."
read -p "Sync the backup (b), or TO (t) portable drives, or FROM (f)? " drctn
rsynccom="rsync -irtv --delete"
if [ $drctn ]; then
	if [ $drctn = "b" ]; then
		echo -e "Okay, running: \e[1m$rsynccom <localdrive> <portabledrivebackup>\e[0m"
		cnfrm="y"
	elif [ $drctn = "t" ]; then
		read -p "Run several: $rsynccom <localdrive> <portabledrive> ? " cnfrm
	elif [ $drctn = "f" ]; then
		echo -e "About to run several: \e[104m$rsynccom <portabledrive> <localdrive>\e[0m"
		read -p "No recovery possible from this operation, GO AHEAD? " cnfrm
	else
		exit
	fi
	if [ ! $cnfrm ] || [ $cnfrm != "y" ]; then exit; fi
else
	exit
fi
mntpnt=/media/jo/
backupdir=( SAMSUNG/rsync-backup/Dr_Current/ \
			SAMSUNG/rsync-backup/Dr_Stack/ \
			SAMSUNG/rsync-backup/F+F/ \
			SAMSUNG/rsync-backup/IT_Dld/ \
			SAMSUNG/rsync-backup/IT_stack/ \
			SAMSUNG/rsync-backup/JH_stack/ )
extdrvdir=( K16GBDTG2/Current/ \
			SAMSUNG/Dr_Stack/ \
			SAMSUNG/F+F/ \
			SAMSUNG/IT_Dld/ \
			SAMSUNG/IT_stack/ \
			SAMSUNG/JH_stack/ )
intdrv=WD2000JD/
intdir=( Current/ \
		 Stack/ \
		 F+F/ \
		 IT_Dld/ \
		 IT_stack/ \
		 JH_stack/ )
i=-1
outf=${BASH_SOURCE[0]}
outf="$mntpnt$intdrv${outf%.*}.txt"
echo "vim: tw=0:" > $outf
echo "" | tee -a $outf
echo $(date) | tee -a $outf
for thisdir in "${intdir[@]}"
do
	intlcn=$mntpnt$intdrv$thisdir
	((i++))
#  	I've put the rsync action in an if-clause to allow for throttling:
	if [ "$i" -ge "0" ]; then
		if [ $drctn = "b" ]; then
			fullcmd="$rsynccom $intlcn $mntpnt${backupdir[i]}"
		elif [ $drctn = "t" ]; then
			fullcmd="$rsynccom $intlcn $mntpnt${extdrvdir[i]}"
		else
			fullcmd="$rsynccom $mntpnt${extdrvdir[i]} $intlcn"
		fi
		echo "" | tee -a $outf
		echo "Push sync $((i+1))" | tee -a $outf
		echo "-----------" | tee -a $outf
		echo $fullcmd | tee -a $outf
		echo "" | tee -a $outf
 		$fullcmd | tee -a $outf
		echo $i
	fi
done
echo "- all done, and logged to $outf"
exit

