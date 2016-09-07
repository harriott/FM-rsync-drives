#!/bin/bash

# Joseph Harriott http://momentary.eu/ Last updated: Wed 07 Sep 2016

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------
#   As this script performs a high-impact operation,
#   I prefer to leave it without executable permission
#   and call it from a terminal with the bash command.
#   eg: bash /mnt/WD2000JD/More/IT_stack/rsync-portabledrives/rsync.sh

# Prepare the locations:
extmnt=/run/media/jo/
mchn=sprbMb
intdrv=/mnt/WD2000JD/
if [ -d /mnt/BX200 ]; then
	mchn=N130
	intdrv=/mnt/BX200/
fi
intdir=( Dropbox/Copied/ \
         Dropbox/Copied-Music-toPlay/ \
         Dropbox/Copied-OutThere-Audio/ \
         Dropbox/Copied-UK-audio/ \
         Dropbox/JH-Close/ \
         Dropbox/JH-F+F/ \
         Dropbox/JH-Further/ \
         Dropbox/JH-Now/ \
         Dropbox/JH-Photos/ \
         Dropbox/JH-Pointure23/ \
		 Dropbox/JH-Stack/ \
		 Dropbox/JH-Work/ \
		 IT-Copied/ \
		 IT-DebianBased-Copied/ \
		 More/ )
# set to 0 to exclude a directory:
include=( 1 \
          1 \
          1 \
          1 \
          1 \
          1 \
          1 \
          1 \
          1 \
          1 \
          1 \
          1 \
          1 \
		  1 \
		  1 )
backupdir=( SAMSUNG/rsync-backup-$mchn/Copied/ \
            SAMSUNG/rsync-backup-$mchn/Copied/-Music-toPlay \
            SAMSUNG/rsync-backup-$mchn/Copied/-OutThere-Audio \
            SAMSUNG/rsync-backup-$mchn/Copied/-UK-audio \
            SAMSUNG/rsync-backup-$mchn/JH-Close/ \
            SAMSUNG/rsync-backup-$mchn/JH-F+F/ \
            SAMSUNG/rsync-backup-$mchn/JH-Further/ \
            SAMSUNG/rsync-backup-$mchn/JH-Now/ \
			SAMSUNG/rsync-backup-$mchn/JH-Photos/ \
			SAMSUNG/rsync-backup-$mchn/JH-Pointure23/ \
			SAMSUNG/rsync-backup-$mchn/JH-Stack/ \
			SAMSUNG/rsync-backup-$mchn/JH-Work/ \
			SAMSUNG/rsync-backup-$mchn/IT_Copied/ \
			SAMSUNG/rsync-backup-$mchn/IT_Copied/-DebianBased \
			SAMSUNG/rsync-backup-$mchn/More/ )
extdrvdir=( SAMSUNG/Dr_Copied/ \
            SAMSUNG/Dr_Copied/-Music-toPlay \
            SAMSUNG/Dr_Copied/-OutThere-Audio \
            SAMSUNG/Dr_Copied/-UK-audio \
            K16GB500/JH-Close/ \
            SAMSUNG/JH-Dr_F+F/ \
            K16GB500/JH-Further/ \
            K16GB500/JH-Now/ \
			SAMSUNG/JH-Dr_Photos/ \
            SAMSUNG/JH-Dr_Pointure23/ \
			SAMSUNG/JH-Dr_Stack/ \
			SAMSUNG/JH-Dr_Work/ \
			SAMSUNG/IT_Copied/ \
			SAMSUNG/IT_Copied/-DebianBased \
			SAMSUNG/More/ )

# List the included directories:
echo -en "This BASH script will run \e[1mrsync\e[0m, pushing all changes, "
echo "either to or from these local directories:"
i=-1
for thisdir in "${intdir[@]}"; do
	((i++))
	if [ ${include[i]} -ne "0" ]; then echo -en "\e[92m  $thisdir"; fi
done
echo -e "\e[0m"

# Ask what to do:
read -p "Sync the backup (b), or TO (t) portable drives, or FROM (f) (or simulate (n))? " drctn
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

# Do it:
i=-1
outf=`basename ${BASH_SOURCE[0]}`
outf="$intdrv${outf%.*}.txt"
echo "vim: tw=0:" > $outf
echo "" | tee -a $outf
echo $(date) | tee -a $outf
for thisdir in "${intdir[@]}"; do
	((i++))
	if [ ${include[i]} -ne "0" ]; then
	    intlcn=$intdrv$thisdir
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
	fi
done
echo "- all done, and logged to $outf"
exit

