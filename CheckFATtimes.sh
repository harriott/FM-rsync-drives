#!/bin/bash

# Joseph Harriott http://momentary.eu/ Last updated: Tue 05 May 2015

# Checks the time differences between matching files stored locally and on a FAT32 USB stick.
# -------------------------------------------------------------------------------------------

locald="/mnt/WD2000JD/Dropbox/"
lenld=${#locald}
FAT32d="/run/media/jo/K16GBDTG2/"
lfilesC=$(find $locald"Current/" -type f)
lfilesP=$(find $locald"Pointure_23/" -type f)

# use newline as file separator (handle spaces in filenames)
IFS=$'\n'

# Prepare the output file:
outf="CheckFATtimes.txt"
echo "vim: tw=0:" > $outf
echo "" >> $outf
echo $(date) >> $outf
echo "" >> $outf

for localf in ${lfilesC}; do
	FAT32f=$FAT32d${localf:$lenld}
	if [ -s $FAT32f ]; then
		#Fft=$(stat -c '%Y' $FAT32f)
		#echo $Fft >> $outf
		echo $FAT32f" "`expr $(stat -c '%Y' $FAT32f) - 1416474468` >> $outf
	fi
done
echo "Results are in $outf"

