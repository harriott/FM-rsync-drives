#!/bin/bash
# vim: set et tw=0:

# Joseph Harriott http://momentary.eu/ Last updated: Mon 23 Dec 2019

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------
#   As this script performs a high-impact operation,
#   I prefer to leave it without executable permission
#   and call it from a terminal with the bash command.
#   eg: bash /<fullpath>/rsync.sh

# Prepare the locations for AcerVeritonT661:
backuppath=/mnt/WD1001FALS/rsyncBackup-AVT661
extmnt=/run/media/jo
intdrv=/mnt/SDSSDA240G
intdir=(
  "/mnt/HD103SJ/Share-AV-Stack/" \
  "/mnt/9QG2FFEE/Share-Dr-CAT-Buddhism/" \
  "/mnt/9QG2FFEE/Share-Dr-CAT-Buddhism-Theravada/" \
  "/mnt/9QG2FFEE/Share-Dr-CAT-OutThere/" \
  "/mnt/9QG2FFEE/Share-Dr-CAT-OutThere-UK/" \
  "/mnt/HD103SJ/Share-IT-Copied/" \
  "/mnt/HD103SJ/Share-IT-DebianBased-Copied/" \
  "/mnt/HD103SJ/Share-More/" \
  "/mnt/HD103SJ/Share-toReduce/" \
  "$intdrv/Dropbox/Apps/" \
  "$intdrv/Dropbox/Copied-OutThere/" \
  "$intdrv/Dropbox/JH/Copied/" \
  "$intdrv/Dropbox/JH/F+F/" \
  "$intdrv/Dropbox/JH/IT_stack/" \
  "$intdrv/Dropbox/JH/Now/" \
  "$intdrv/Dropbox/JH/Theatre0/" \
  "$intdrv/Dropbox/JH/Theatre1/" \
  "$intdrv/Dropbox/JH/Then0/" \
  "$intdrv/Dropbox/JH/Then1/" \
  "$intdrv/Dropbox/JH/toReduce/" \
  "$intdrv/Dropbox/JH/Work/" \
  "$intdrv/Dropbox/Photos/" \
  "$intdrv/Dropbox/CAM-fromSharon/" \
  "$intdrv/Dropbox/CAM-UK/" \
  "$intdrv/Dropbox/CAM-USA/" \
  "$intdrv/Dropbox/CAMusic/" \
  "$intdrv/Dropbox/JH/Stack/" \
)
scriptFolder=$( dirname "${BASH_SOURCE[0]}" )
source "$scriptFolder/include.sh"
backupdir=(
  $backuppath/Share-AV-Stack/ \
  $backuppath/Share-Dr-CAT-Buddhism/ \
  $backuppath/Share-Dr-CAT-Buddhism-Theravada/ \
  $backuppath/Share-Dr-CAT-OutThere/ \
  $backuppath/Share-Dr-CAT-OutThere-UK/ \
  $backuppath/Share-IT-Copied/ \
  $backuppath/Share-IT-DebianBased-Copied/ \
  $backuppath/Share-More/ \
  $backuppath/Share-toReduce/ \
  $backuppath/Sync1-Dr-Apps/ \
  $backuppath/Sync0-Dr-Copied-OutThere/ \
  $backuppath/Sync0-Dr-JH-Copied/ \
  $backuppath/Sync0-Dr-JH-F+F/ \
  $backuppath/Sync0-Dr-JH-IT_stack/ \
  $backuppath/Sync0-Dr-JH-Now/ \
  $backuppath/Sync0-Dr-JH-Theatre0/ \
  $backuppath/Sync0-Dr-JH-Theatre1/ \
  $backuppath/Sync0-Dr-JH-Then0/ \
  $backuppath/Sync0-Dr-JH-Then1/ \
  $backuppath/Sync0-Dr-JH-toReduce/ \
  $backuppath/Sync0-Dr-JH-Work/ \
  $backuppath/Sync0-Dr-Photos/ \
  $backuppath/Sync1-Dr-CAM-fromSharon/ \
  $backuppath/Sync1-Dr-CAM-UK/ \
  $backuppath/Sync1-Dr-CAM-USA/ \
  $backuppath/Sync1-Dr-CAMusic/ \
  $backuppath/Sync1-Dr-JH-Stack/ \
)
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
  SM3/Sync0/Dr-JH-Copied/ \
  SM3/Sync0/Dr-JH-F+F/ \
  SM3/Sync0/Dr-JH-IT_stack/ \
  SM3/Sync0/Dr-JH-Now/ \
  SM3/Sync0/Dr-JH-Theatre0/ \
  SM3/Sync0/Dr-JH-Theatre1/ \
  SM3/Sync0/Dr-JH-Then0/ \
  SM3/Sync0/Dr-JH-Then1/ \
  SM3/Sync0/Dr-JH-toReduce/ \
  SM3/Sync0/Dr-JH-Work/ \
  SM3/Sync0/Dr-Photos/ \
  SM3/Sync1/Dr-CAM-fromSharon/ \
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
printf -v included "%02d" $j
echo -e "\e[0m"

# Ask what to do:
read -p "Sync the backup (b), or TO (T) portable drives (or simulate (t)), or FROM (F) (or simulate (f))? " drctn
rsynccom="rsync -ilrtv --delete"
if [ $drctn ]; then
    if [ $drctn = "b" ]; then
        echo -e "Okay, running: \e[1m$rsynccom <localdrive> <backupdrivebackup>\e[0m"
        cnfrm="y"
    elif [ $drctn = "T" ]; then
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
j=0
for thisdir in "${intdir[@]}"; do
    ((i++))
    if [ ${include[i]} -ne "0" ]; then
        if [ ! $thisdir = "-" ]; then
            ((j++))
            if [ $drctn = "b" ]; then
                fullcmd="$rsynccom $thisdir ${backupdir[i]}"
            else
                extdd=${extdrvdir[i]}
                if [ ${extdd%%/*} = "K16GB500" ]; then
                    modrsc=" --modify-window=1" # don't send fraction of second changes
                else
                    modrsc=""
                fi
                if [ ${drctn,,} = "t" ]; # case-insensitive test
                then
                    fullcmd="$rsynccom$modrsc $thisdir $extmnt/$extdd"
                else
                    modrsc=" --modify-window=1" # don't receive fraction of second changes
                    fullcmd="$rsynccom$modrsc $extmnt/$extdd $thisdir"
                fi
            fi
            echo "" | tee -a $outf1
            printf -v include "%02d" $j
            echo "Push sync $include of $included" | tee -a $outf1
            echo "------------------" | tee -a $outf1
            echo $fullcmd | tee -a $outf1
            echo "" | tee -a $outf1
            $fullcmd | tee -a $outf1 # - disable for testing
        fi
    fi
done
jHM=$(date "+%j-%H%M")
outf2="$outf0-$jHM.log"
cp $outf1 $outf2
echo "- all done, and logged to $outf1 (& $outf2)"
exit

