#!/bin/bash

# Joseph Harriott http://momentary.eu/ Last updated: Tue 05 May 2015

# Checks the time differences between matching files stored locally and on a FAT32 USB stick.
# -------------------------------------------------------------------------------------------

locald="/mnt/WD2000JD/Dropbox/"
lenld=${#locald}
FAT32d="/run/media/jo/K16GBDTG2/"
lfilesC=$(find $locald"Current/" -type f)
lfilesP=$(find $locald"Pointure_23/EsL/" -type f)

# use newline as file separator (handle spaces in filenames)
IFS=$'\n'

# Prepare the output file:
outf="CheckFATtimes.txt"
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

for localfs in $lfilesC $lfilesP; do
	for localf in ${localfs}; do
		FAT32f=$FAT32d${localf:$lenld}
		if [ -s $FAT32f ]; then
			timediff=$(expr $(stat -c '%Y' $FAT32f) - $(stat -c '%Y' $localf))
			if [ $timediff != "0" ]; then
				printf "%10s $FAT32f\n" $timediff >> $outf
			fi
		else
			echo "         - "$FAT32f >> $outf
		fi
	done
done
echo "Results are in $outf"

