#!/bin/bash

# Joseph Harriott http://momentary.eu/ Last updated: Tue 23 Jun 2015

# Check the time differences between matching files stored locally and on a FAT32 USB stick.
# ------------------------------------------------------------------------------------------
# bash /home/jo/Files/IT_stack/rsync-portabledrives/CheckFATtimes.sh

# For error catching, allow the echo below, and: rm CFt-err.txt; bash /home/jo/Files/IT_stack/rsync-portabledrives/CheckFATtimes.sh 2>&1 | tee -a CFt-err.txt

# Try to find Dropbox folder
locald="/mnt/WD2000JD/Dropbox/"
machine="sprbMb"
if [ ! -s $locald ]; then
	locald="/home/jo/Dropbox/";
	if [ ! -s $locald ]; then
		echo "Can't find Dropbox folder.";
		exit
	fi
	machine="N130"
fi

# other directory parameters
lenld=${#locald}
FAT32d="/run/media/jo/K16GBDTG2/"

# Arrays filled with filenames:
lfilesC=$(find $locald"Current/" -type f)
lfilesF=$(find $locald"F+F/from_Dipton_Avenue/maternally_related/Tante Piet/" -type f)
lfilesP=$(find $locald"Pointure_23/EsL/" -type f)

# use newline as file separator (handle spaces in filenames)
IFS=$'\n'

# Prepare the output file:
outfb=$FAT32d"CheckFATtimes"
outf="$outfb-$machine.txt"
echo "vim: tw=0:" > $outf
echo "" >> $outf
echo $(date) >> $outf
echo "" >> $outf
echo "Files on FAT32 drive's time offsets:" >> $outf
echo "      3600   file's 1h newer than local" >> $outf
echo "      7200   file's 2h newer than local" >> $outf
echo "     -3600   file's 1h older than local" >> $outf
echo "     -7200   file's 2h older than local" >> $outf
echo "         -   file ain't there" >> $outf
echo "" >> $outf

for localfs in $lfilesC $lfilesF $lfilesP; do
	#echo "- checking $localfs" # - for error catching
	for localf in ${localfs}; do
		FAT32f=$FAT32d${localf:$lenld}
		if [ -s $FAT32f ]; then
			timediff=$(expr $(stat -c '%Y' $FAT32f) - $(stat -c '%Y' $localf))
			if [ $timediff != "0" ]; then
				printf "%10s ${FAT32f//%/%%}\n" $timediff >> $outf # allowing % in filenames
			fi
		else
			echo "         - "$FAT32f >> $outf
		fi
	done
done
echo "Results are in $outf"

