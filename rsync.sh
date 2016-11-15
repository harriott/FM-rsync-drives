#!/bin/bash
# vim: set et tw=0:

# Joseph Harriott http://momentary.eu/ Last updated: Mon 14 Nov 2016

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------
#   As this script performs a high-impact operation,
#   I prefer to leave it without executable permission
#   and call it from a terminal with the bash command.
#   eg: bash /mnt/SDSSDA240G/More/IT_stack/rsync-portabledrives/rsync.sh

# Prepare the locations:
backupdrv=/mnt/WD30EZRZ
extmnt=/run/media/jo
mchn=sprbMb
intdrv=/mnt/SDSSDA240G
intdir=( "$intdrv/Dropbox/Copied/" \
         "$intdrv/Dropbox/Copied-Music-toPlay/" \
         "$intdrv/Dropbox/Copied-OutThere-Audio/" \
         "$intdrv/Dropbox/Copied-UK-Audio/" \
         "$intdrv/Dropbox/JH/d-F+F/" \
         "$intdrv/Dropbox/JH/d-Stack/" \
         "$intdrv/Dropbox/JH/d-Theatre/" \
         "$intdrv/Dropbox/JH/k-Copied/" \
         "$intdrv/Dropbox/JH/k-Now/" \
         "$intdrv/Dropbox/JH/k-Then0/" \
         "$intdrv/Dropbox/JH/k-Then1/" \
         "$intdrv/Dropbox/JH/k-Work/" \
         "$intdrv/Dropbox/Photos/" \
         "$backupdrv/IT-Copied/" \
         "$backupdrv/IT-DebianBased-Copied/" \
         "$intdrv/More/" )
if [ -d /mnt/BX200 ]; then
    backupdrv="$extmnt/SAMSUNG"
    mchn=N130
    intdrv=/mnt/BX200
    intdir=( "$intdrv/Dropbox/Copied/" \
             "$intdrv/Dropbox/Copied-Music-toPlay/" \
             "$intdrv/Dropbox/Copied-OutThere-Audio/" \
             "$intdrv/Dropbox/Copied-UK-Audio/" \
             "$intdrv/Dropbox/JH/d-F+F/" \
             "$intdrv/Dropbox/JH/d-Stack/" \
             "$intdrv/Dropbox/JH/d-Theatre/" \
             "$intdrv/Dropbox/JH/k-Copied/" \
             "$intdrv/Dropbox/JH/k-Now/" \
             "$intdrv/Dropbox/JH/k-Then0/" \
             "$intdrv/Dropbox/JH/k-Then1/" \
             "$intdrv/Dropbox/JH/k-Work/" \
             "$intdrv/Dropbox/Photos/" \
             "$intdrv/IT-Copied/" \
             "$intdrv/IT-DebianBased-Copied/" \
             "$intdrv/More/" )
fi
# Define an array like  include=(1 1 ... ), with values set to 0 to exclude directories:
source "$( dirname "${BASH_SOURCE[0]}" )/include.sh"
backupdir=( $backupdrv/rsync-backup-$mchn/Copied/ \
            $backupdrv/rsync-backup-$mchn/Copied-Music-toPlay/ \
            $backupdrv/rsync-backup-$mchn/Copied-OutThere-Audio/ \
            $backupdrv/rsync-backup-$mchn/Copied-UK-Audio/ \
            $backupdrv/rsync-backup-$mchn/JH-d-F+F/ \
            $backupdrv/rsync-backup-$mchn/JH-d-Stack/ \
            $backupdrv/rsync-backup-$mchn/JH-d-Theatre/ \
            $backupdrv/rsync-backup-$mchn/JH-k-Copied/ \
            $backupdrv/rsync-backup-$mchn/JH-k-Now/ \
            $backupdrv/rsync-backup-$mchn/JH-k-Then0/ \
            $backupdrv/rsync-backup-$mchn/JH-k-Then1/ \
            $backupdrv/rsync-backup-$mchn/JH-k-Work/ \
            $backupdrv/rsync-backup-$mchn/Photos/ \
            $backupdrv/rsync-backup-$mchn/IT-Copied/ \
            $backupdrv/rsync-backup-$mchn/IT-DebianBased-Copied/ \
            $backupdrv/rsync-backup-$mchn/More/ )
extdrvdir=( SAMSUNG/Sync/Dr-Copied/ \
            SAMSUNG/Sync/Dr-Copied-Music-toPlay/ \
            SAMSUNG/Sync/Dr-Copied-OutThere-Audio/ \
            SAMSUNG/Sync/Dr-Copied-UK-Audio/ \
            SAMSUNG/Sync/Dr-JH-d-F+F/ \
            SAMSUNG/Sync/Dr-JH-d-Stack/ \
            SAMSUNG/Sync/Dr-JH-d-Theatre/ \
            SAMSUNG/Sync/Dr-JH-k-Copied/ \
            SAMSUNG/Sync/Dr-JH-k-Now/ \
            SAMSUNG/Sync/Dr-JH-k-Then0/ \
            SAMSUNG/Sync/Dr-JH-k-Then1/ \
            SAMSUNG/Sync/Dr-JH-k-Work/ \
            SAMSUNG/Sync/Dr-Photos/ \
            SAMSUNG/Sync/IT-Copied/ \
            SAMSUNG/Sync/IT-DebianBased-Copied/ \
            SAMSUNG/Sync/More/ )

# List the included directories:
echo -en "This BASH script will run \e[1mrsync\e[0m, pushing all changes, "
echo "either to or from these local directories:"
i=-1
for thisdir in "${intdir[@]}"; do
    ((i++))
    if [ ${include[i]} -ne "0" ]; then echo -en "\e[92m  $thisdir\n"; fi
done
echo -e "\e[0m"

# Ask what to do:
read -p "Sync the backup (b), or TO (T) portable drives (or simulate (t)), or FROM (F) (or simulate (f))? " drctn
rsynccom="rsync -irtv --delete"
if [ $drctn ]; then
    if [ $drctn = "b" ]; then
        echo -e "Okay, running: \e[1m$rsynccom <localdrive> <backupdrivebackup>\e[0m"
        cnfrm="y"
    elif [ $drctn = "T" ]; then
        read -p "Run several: $rsynccom <localdrive> <portabledrive> ? " cnfrm
    elif [ $drctn = "t" ]; then
        rsynccom="rsync -inrtv --delete" # simulate
        echo -e "Okay, running: \e[1m$rsynccom <localdrive> <portabledrivebackup>\e[0m"
        cnfrm="y"
    elif [ $drctn = "F" ]; then
        echo -e "About to run several: \e[1m\e[95m$rsynccom <portabledrive> <localdrive>\e[0m"
        read -p "No recovery possible from this operation, GO AHEAD? " cnfrm
    elif [ $drctn = "f" ]; then
        rsynccom="rsync -inrtv --delete" # simulate
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
outf1="$outf0.txt"
echo "vim: tw=0:" > $outf1
echo "" | tee -a $outf1
echo $(date) | tee -a $outf1
for thisdir in "${intdir[@]}"; do
    ((i++))
    if [ ${include[i]} -ne "0" ]; then
        intlcn=$thisdir
        if [ $drctn = "b" ]; then
            fullcmd="$rsynccom $intlcn ${backupdir[i]}"
        else
            extdd=${extdrvdir[i]}
            if [ ${extdd%%/*} = "K16GB500" ]; then
                modrsc=" --modify-window=1"
            else
                modrsc=""
            fi
            if [ ${drctn,,} = "t" ]; # case-insensitive test
            then
                fullcmd="$rsynccom$modrsc $intlcn $extmnt/$extdd"
            else
                fullcmd="$rsynccom$modrsc $extmnt/$extdd $intlcn"
            fi
        fi
        echo "" | tee -a $outf1
        echo "Push sync $((i+1))" | tee -a $outf1
        echo "-----------" | tee -a $outf1
        echo $fullcmd | tee -a $outf1
        echo "" | tee -a $outf1
        $fullcmd | tee -a $outf1 # - disable for testing
    fi
done
jHM=$(date "+%j-%H%M")
outf2="$outf0-$jHM.txt"
cp $outf1 $outf2
echo "- all done, and logged to $outf1 (& $outf2)"
exit

