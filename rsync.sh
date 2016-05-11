#!/bin/bash

# Joseph Harriott http://momentary.eu/ Last updated: Wed 11 May 2016

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------
#   As this script performs a high-impact operation,
#   I prefer to leave it without executable permission
#   and call it from a terminal with the bash command.
#   eg: bash ~/Files/IT_stack/rsync-portabledrives/rsync.sh

echo "This BASH script will run rsync, pushing all changes."
read -p "Sync the backup (b), or TO (t) portable drives, or FROM (f) (or simulate (n))?" drctn
rsynccom="rsync -irtv --delete"
if [ $drctn ]; then
	if [ $drctn = "b" ]; then
		echo -e "Okay, running: \e[1m$rsynccom <localdrive> <portabledrivebackup>\e[0m"
		cnfrm="y"
	elif [ $drctn = "t" ]; then
		read -p "Run several: $rsynccom <localdrive> <portabledrive> ? " cnfrm
	elif [ $drctn = "f" ]; then
		echo -e "About to run several: \e[1m\e[95m$rsynccom <portabledrive> <localdrive>\e[0m"
		read -p "No recovery possible from this operation, GO AHEAD? " cnfrm
	elif [ $drctn = "n" ]; then
        rsynccom="rsync -inrtv --delete"
		echo -e "Okay, running: \e[1m$rsynccom <portabledrivebackup> <localdrive>\e[0m"
		cnfrm="y"
	else
		exit
	fi
	if [ ! $cnfrm ] || [ $cnfrm != "y" ]; then exit; fi
else
	exit
fi
extmnt=/run/media/jo/
mchn=sprbMb
intdrv=/mnt/WD2000JD/
if [ -d /mnt/BX200 ]; then
	mchn=N130
	intdrv=/mnt/BX200/
fi
backupdir=( SAMSUNG/rsync-backup-$mchn/Dr_Close/ \
            SAMSUNG/rsync-backup-$mchn/Dr_Copied/ \
            SAMSUNG/rsync-backup-$mchn/Dr_F+F/ \
            SAMSUNG/rsync-backup-$mchn/Dr_Further/ \
            SAMSUNG/rsync-backup-$mchn/Dr_Now/ \
			SAMSUNG/rsync-backup-$mchn/Dr_Photos/ \
			SAMSUNG/rsync-backup-$mchn/Dr_Pointure_23/ \
			SAMSUNG/rsync-backup-$mchn/Dr_Stack/ \
			SAMSUNG/rsync-backup-$mchn/Files/ )
extdrvdir=( K16GB500/Close/ \
            SAMSUNG/Dr_Copied/ \
            SAMSUNG/Dr_F+F/ \
            K16GB500/Further/ \
            K16GB500/Now/ \
			SAMSUNG/Dr_Photos/ \
            SAMSUNG/Dr_Pointure_23/ \
			SAMSUNG/Dr_Stack/ \
			SAMSUNG/Files/ )
# just prefix the following with a letter to exclude them:
intdir=( iDropbox/Close/ \
         iDropbox/Copied/ \
         iDropbox/F+F/ \
         iDropbox/Further/ \
         iDropbox/Now/ \
         iDropbox/Photos/ \
         iDropbox/Pointure_23/ \
		 iDropbox/Stack/ \
		 iFiles/ )
i=-1
outf=`basename ${BASH_SOURCE[0]}`
outf="$intdrv${outf%.*}.txt"
echo "vim: tw=0:" > $outf
echo "" | tee -a $outf
echo $(date) | tee -a $outf
for thisdir in "${intdir[@]}"; do
	intlcn=$intdrv$thisdir
	((i++))
	if [ $drctn = "b" ]; then
		fullcmd="$rsynccom $intlcn $extmnt${backupdir[i]}"
	else
		extdd=${extdrvdir[i]}
		if [ ${extdd%%/*} = "K16GB500" ]; then
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
	$fullcmd | tee -a $outf # - disable for testing
done
echo "- all done, and logged to $outf"
exit

