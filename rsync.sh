#!/bin/bash
# vim: set et tw=0:

# Joseph Harriott http://momentary.eu/ Last updated: Sun 24 May 2020

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------
#   As this script performs a high-impact operation,
#   I prefer to leave it without executable permission
#   and call it from a terminal with the bash command.
#   eg: bash /<fullpath>/rsync.sh

# Prepare the locations for AcerVeritonT661:
extmnt=/run/media/jo
intdrv=/mnt/SDSSDA240G
intdir=(
  "/mnt/9QG2FFEE/Share/AV-Stack/" \
  "/mnt/9QG2FFEE/Share/Dr-CAT-Buddhism/" \
  "/mnt/9QG2FFEE/Share/Dr-CAT-Buddhism-Theravada/" \
  "/mnt/9QG2FFEE/Share/Dr-CAT-OutThere/" \
  "/mnt/9QG2FFEE/Share/Dr-CAT-OutThere-UK/" \
  "/mnt/9QG2FFEE/Share/IT-Copied/" \
  "/mnt/9QG2FFEE/Share/IT-DebianBased-Copied/" \
  "/mnt/9QG2FFEE/Share/More/" \
  "/mnt/9QG2FFEE/Share/toReduce/" \
  "$intdrv/Dropbox/Apps/" \
  "$intdrv/Dropbox/Copied-OutThere/" \
  "$intdrv/Dropbox/JH/Cafezoide/" \
  "$intdrv/Dropbox/JH/CforWork/" \
  "$intdrv/Dropbox/JH/Copied/" \
  "$intdrv/Dropbox/JH/F+F/" \
  "$intdrv/Dropbox/JH/IT_stack/" \
  "$intdrv/Dropbox/JH/JCD-imagey-e3/" \
  "$intdrv/Dropbox/JH/Now/" \
  "$intdrv/Dropbox/JH/Theatre0/" \
  "$intdrv/Dropbox/JH/Theatre1/" \
  "$intdrv/Dropbox/JH/Then0/" \
  "$intdrv/Dropbox/JH/Then1/" \
  "$intdrv/Dropbox/JH/toReduce/" \
  "$intdrv/Dropbox/JH/Work/" \
  "$intdrv/Dropbox/Photos/" \
  "$intdrv/Dropbox/CAM-toSort/" \
  "$intdrv/Dropbox/CAM-UK/" \
  "$intdrv/Dropbox/CAM-USA/" \
  "$intdrv/Dropbox/CAMusic/" \
  "$intdrv/Dropbox/JH/Stack/" \
)
scriptFolder=$( dirname "${BASH_SOURCE[0]}" )
source "$scriptFolder/include.sh"
# source "$scriptFolder/N130.sh"
# This drive defines the sort order:
extdrvdir=(
  SM3/Share/AV-Stack/ \
  SM3/Share/Dr-CAT-Buddhism/ \
  SM3/Share/Dr-CAT-Buddhism-Theravada/ \
  SM3/Share/Dr-CAT-OutThere/ \
  SM3/Share/Dr-CAT-OutThere-UK/ \
  SM3/Share/IT-Copied/ \
  SM3/Share/IT-DebianBased-Copied/ \
  SM3/Share/More/ \
  SM3/Share/toReduce/ \
  SM3/Sync1/Dr-Apps/ \
  SM3/Sync0/Dr-Copied-OutThere/ \
  SM3/Sync0/Dr-JH-Cafezoide/ \
  SM3/Sync0/Dr-JH-CforWork/ \
  SM3/Sync0/Dr-JH-Copied/ \
  SM3/Sync0/Dr-JH-F+F/ \
  SM3/Sync0/Dr-JH-IT_stack/ \
  SM3/Sync0/Dr-JH-JCD-imagey-e3/ \
  SM3/Sync0/Dr-JH-Now/ \
  SM3/Sync0/Dr-JH-Theatre0/ \
  SM3/Sync0/Dr-JH-Theatre1/ \
  SM3/Sync0/Dr-JH-Then0/ \
  SM3/Sync0/Dr-JH-Then1/ \
  SM3/Sync0/Dr-JH-toReduce/ \
  SM3/Sync0/Dr-JH-Work/ \
  SM3/Sync0/Dr-Photos/ \
  SM3/Sync1/Dr-CAM-toSort/ \
  SM3/Sync1/Dr-CAM-UK/ \
  SM3/Sync1/Dr-CAM-USA/ \
  SM3/Sync1/Dr-CAMusic/ \
  SM3/Sync1/Dr-JH-Stack/ \
)

# List the included directories:
echo -en "This BASH script will run \e[1mrsync\e[0m, pushing all changes, "
echo "either to or from these local directories:"
i=-1
j=0
for thisdir in "${intdir[@]}"; do
    if [ ! $thisdir = "-" ]; then
        ((i++))
        if [ ${include[i]} -ne "0" ]; then
          echo -en "\e[92m  $thisdir\n"
          ((j++))
        fi
    fi
done
printf -v included "%02d" $j  # catches the total number of included locations
echo -e "\e[0m"

# Ask what to do:
read -p "Sync TO (T) portable drives (or simulate (t)), or FROM (F) (or simulate (f))? " drctn
rsynccom="rsync -ilrtv --delete"
if [ $drctn ]; then
    if [ $drctn = "T" ]; then
        read -p "Run several: $rsynccom <localdrive> <portabledrive> ? " cnfrm
    elif [ $drctn = "t" ]; then
        rsynccom="rsync -ilnrtv --delete" # simulate
        echo -e "Okay, running: \e[1m$rsynccom <localdrive> <portabledrivebackup>\e[0m"
        cnfrm="y"
    elif [ $drctn = "F" ]; then
        echo -e "About to run several: \e[1m\e[95m$rsynccom <portabledrive> <localdrive>\e[0m"
        read -p "No recovery possible from this operation, GO AHEAD? " cnfrm
    elif [ $drctn = "f" ]; then
        rsynccom="rsync -ilnrtv --delete" # simulate
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
outf0="$intdrv/${outf%.*}"
outf1="$outf0.log"
echo "vim: tw=0:" > $outf1
echo "" | tee -a $outf1
echo $(date) | tee -a $outf1
underline='------------------'
j=0
for thisdir in "${intdir[@]}"; do
    ((i++))
    if [ ${include[i]} -ne "0" ]; then
        if [ ! $thisdir = "-" ]; then
            ((j++))
            extdd=${extdrvdir[i]}
            if [ ${extdd%%/*} = 'K16GB500' ] # it's a FAT32 drive
            then
                modrsc=" --modify-window=1" # don't send fraction of second changes
            else
                modrsc=""
            fi
            if [ ${drctn,,} = "t" ]; # case-insensitive test
            then
                cmd="$rsynccom$modrsc"
                fr="$thisdir"
                to="$extmnt/$extdd"
            else
                modrsc=" --modify-window=1" # don't receive fraction of second changes
                cmd="$rsynccom$modrsc"
                fr="$extmnt/$extdd"
                to="$thisdir"
            fi
            echo "" | tee -a $outf1
            printf -v include "%02d" $j
            echo "Push sync $include of $included" | tee -a $outf1
            echo $underline | tee -a $outf1
            fullcmd="$cmd $fr $to"
            echo $fullcmd | tee -a $outf1
            [ ! -d $fr ] && echo "--- !!! $fr ain't there !!! ---" >> $outf1
            echo "" | tee -a $outf1
            $fullcmd | tee -a $outf1 # - disable for testing
        fi
    fi
done
jHM=$(date "+%j-%H%M")
outf2="$outf0-$jHM.log"
cp $outf1 $outf2
echo "- all done, and logged to $outf1 (& $outf2)"
gvim -c "silent! /$underline" $outf1
exit

