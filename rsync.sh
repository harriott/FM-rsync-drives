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
if [ -f /etc/os-release ]; then
	. /etc/os-release
	extmnt=/run/media/jo/
	if [ "$NAME" = "Arch Linux" ]; then
		intdrv=/mnt/WD2000JD/
		mchn=sprbMb
	elif [ "$NAME" = "openSUSE" ]; then
		intdrv=~/
		mchn=N130
   	fi
else
	extmnt=/media/jo/
	intdrv=${extmnt}WD2000JD/
fi
backupdir=( SAMSUNG/rsync-backup-$mchn/Dr_Copied/ \
            SAMSUNG/rsync-backup-$mchn/Dr_Current/ \
            SAMSUNG/rsync-backup-$mchn/Dr_F+F/ \
            SAMSUNG/rsync-backup-$mchn/Dr_JH/ \
			SAMSUNG/rsync-backup-$mchn/Dr_Pointure_23/ \
			SAMSUNG/rsync-backup-$mchn/Dr_Stack/ \
			SAMSUNG/rsync-backup-$mchn/Files/ )
extdrvdir=( SAMSUNG/Dr_Copied/ \
            K16GBDTG2/Current/ \
            K16GBDTG2/F+F/ \
            K16GBDTG2/JH/ \
            K16GBDTG2/Pointure_23/ \
			SAMSUNG/Dr_Stack/ \
			SAMSUNG/Files/ )
intdir=( Dropbox/Copied/ \
         Dropbox/Current/ \
         Dropbox/F+F/ \
         Dropbox/JH/ \
         Dropbox/Pointure_23/ \
		 Dropbox/Stack/ \
		 Files/ )
i=-1
outf=`basename ${BASH_SOURCE[0]}`
outf="$intdrv${outf%.*}.txt"
echo "vim: tw=0:" > $outf
echo "" | tee -a $outf
echo $(date) | tee -a $outf
for thisdir in "${intdir[@]}"; do
	intlcn=$intdrv$thisdir
	((i++))
	#  	I've put the rsync action in an if-clause to allow for throttling (0 allows all):
	if [ "$i" -ge "0" ]; then
		if [ $drctn = "b" ]; then
			fullcmd="$rsynccom $intlcn $extmnt${backupdir[i]}"
		else
			extdd=${extdrvdir[i]}
			if [ ${extdd%%/*} = "K16GBDTG2" ]; then
				modrsc=" --modify-window=1"
			else
				modrsc=""
			fi
			if [ $drctn = "t" ]; then
				fullcmd="$rsynccom$modrsc $intlcn $extmnt$extdd"
			else
				fullcmd="$rsynccom$modrsc $extmnt$extdd $intlcn"
			fi
		fi
		echo "" | tee -a $outf
		echo "Push sync $((i+1))" | tee -a $outf
		echo "-----------" | tee -a $outf
		echo $fullcmd | tee -a $outf
		echo "" | tee -a $outf
 		$fullcmd | tee -a $outf # - disable when testing
	fi
done
echo "- all done, and logged to $outf"
exit

