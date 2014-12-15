#!/bin/bash

# Joseph Harriott http://momentary.eu/ Last updated: lun. 15 déc. 2014

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------
#   As this script performs a high-impact operation,
#   I prefer to leave it without executable permission
#   and call it from a terminal with the bash command.

echo "This BASH script will run rsync, pushing all changes."
read -p "Sync TO (t) or FROM (f) portable drives? " drctn
rsynccom="rsync -irtv --delete"
if [ $drctn ]; then
	if [ $drctn = "t" ]; then
		echo -e "Okay, about to run: \e[104m$rsynccom <localdrive> <portabledrive>\e[0m"
	elif [ $drctn = "f" ]; then
		echo -e "Okay, about to run: \e[104m$rsynccom <portabledrive> <localdrive>\e[0m"
	else
		exit
	fi
else
	exit
fi
read -p "No recovery possible from this operation, GO AHEAD? " cnfrm
if [ $cnfrm ] && [ $cnfrm = "y" ]; then
	mntpnt=/media/jo/
	extdrvdir=( K16GBDTG2/Current/ \
				SAMSUNG/Dr_Stack/ \
				SAMSUNG/F+F/ \
				SAMSUNG/IT_Dld/ \
				SAMSUNG/IT_stack/ \
				SAMSUNG/JH_stack/ )
	intdrvdir=( WD2000JD/Current/ \
				WD2000JD/Stack/ \
				WD2000JD/F+F/ \
				WD2000JD/IT_Dld/ \
				WD2000JD/IT_stack/ \
				WD2000JD/JH_stack/ )
	i=-1
	outf=${BASH_SOURCE[0]}
    outf="${outf%.*}.txt"
	echo "vim: tw=0:" > $outf
	for extlcn in "${extdrvdir[@]}"
	do
		((i++))
#   	I've put the rsync action in an if-clause to allow for throttling:
		if [ "$i" -ge "0" ]; then
			if [ $drctn = "t" ]; then
				fullcmd="$rsynccom $mntpnt${intdrvdir[i]} $mntpnt$extlcn"
			else
				fullcmd="$rsynccom $mntpnt$extlcn $mntpnt${intdrvdir[i]}"
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
fi
exit

