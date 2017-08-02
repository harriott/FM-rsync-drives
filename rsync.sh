#!/bin/bash
# vim: set et tw=0:

# Joseph Harriott http://momentary.eu/ Last updated: Wed 02 Aug 2017

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------
#   As this script performs a high-impact operation,
#   I prefer to leave it without executable permission
#   and call it from a terminal with the bash command.
#   eg: bash /mnt/WD30EZRZ/Dropbox/JH/IT_stack/rsync-portabledrives/rsync.sh

# Prepare the locations:
backuppath=/mnt/WD1001FALS/rsyncBackup-sprbMb
extmnt=/run/media/jo
intdrv=/mnt/WD30EZRZ
intdir=( "$intdrv/Dropbox/CA-Buddhism/" \
         "$intdrv/Dropbox/CAMusic-Europe/" \
         "$intdrv/Dropbox/CAMusic-Germanic/" \
         "$intdrv/Dropbox/CAMusic-USA/" \
         "$intdrv/Dropbox/CAMusic-West/" \
         "$intdrv/Dropbox/CAMusic-World/" \
         "$intdrv/Dropbox/CA-OutThere-UK/" \
         "$intdrv/Dropbox/CA-Theravada/" \
         "$intdrv/Dropbox/CAudio-Music/" \
         "$intdrv/Dropbox/CAudio-OutThere/" \
         "$intdrv/Dropbox/Copied-OutThere/" \
         "$intdrv/Dropbox/JH/Copied/" \
         "$intdrv/Dropbox/JH/F+F/" \
         "$intdrv/Dropbox/JH/IT_stack/" \
         "$intdrv/Dropbox/JH/Now/" \
         "$intdrv/Dropbox/JH/Stack/" \
         "$intdrv/Dropbox/JH/Theatre0/" \
         "$intdrv/Dropbox/JH/Theatre1/" \
         "$intdrv/Dropbox/JH/Then0/" \
         "$intdrv/Dropbox/JH/Then1/" \
         "$intdrv/Dropbox/JH/toReduce/" \
         "$intdrv/Dropbox/JH/Work/" \
         "$intdrv/Dropbox/Photos/" \
         "/mnt/SDSSDA240G/IT-Copied/" \
         "/mnt/SDSSDA240G/IT-DebianBased-Copied/" \
         "/mnt/SDSSDA240G/More/" )
source "$( dirname "${BASH_SOURCE[0]}" )/include.sh"
backupdir=( $backuppath/Dr-CA-Buddhism/ \
            $backuppath/Dr-CAMusic-Europe/ \
            $backuppath/Dr-CAMusic-Germanic/ \
            $backuppath/Dr-CAMusic-USA/ \
            $backuppath/Dr-CAMusic-West/ \
            $backuppath/Dr-CAMusic-World/ \
            $backuppath/Dr-CA-OutThere-UK/ \
            $backuppath/Dr-CA-Theravada/ \
            $backuppath/Dr-CAudio-Music/ \
            $backuppath/Dr-CAudio-OutThere/ \
            $backuppath/Dr-Copied-OutThere/ \
            $backuppath/Dr-JH-Copied/ \
            $backuppath/Dr-JH-F+F/ \
            $backuppath/Dr-JH-IT_stack/ \
            $backuppath/Dr-JH-Now/ \
            $backuppath/Dr-JH-Stack/ \
            $backuppath/Dr-JH-Theatre0/ \
            $backuppath/Dr-JH-Theatre1/ \
            $backuppath/Dr-JH-Then0/ \
            $backuppath/Dr-JH-Then1/ \
            $backuppath/Dr-JH-toReduce/ \
            $backuppath/Dr-JH-Work/ \
            $backuppath/Dr-Photos/ \
            $backuppath/IT-Copied/ \
            $backuppath/IT-DebianBased-Copied/ \
            $backuppath/More/ )
if [ -d /mnt/BX200 ]; then
    backuppath="$extmnt/SAMSUNG/rsyncBackupN130"
    intdrv=/mnt/BX200
    intdir=( "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "$intdrv/Dropbox/JH/k-Now/" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "$intdrv/More/" )
    backupdir=( "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                $backuppath/Dr-JH-Now/ \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                $backuppath/More/ )
fi
extdrvdir=( SAMSUNG/Sync/Dr-CA-Buddhism/ \
            SAMSUNG/Sync/Dr-CAMusic-Europe/ \
            SAMSUNG/Sync/Dr-CAMusic-Germanic/ \
            SAMSUNG/Sync/Dr-CAMusic-USA/ \
            SAMSUNG/Sync/Dr-CAMusic-West/ \
            SAMSUNG/Sync/Dr-CAMusic-World/ \
            SAMSUNG/Sync/Dr-CA-OutThere-UK/ \
            SAMSUNG/Sync/Dr-CA-Theravada/ \
            SAMSUNG/Sync/Dr-CAudio-Music/ \
            SAMSUNG/Sync/Dr-CAudio-OutThere/ \
            SAMSUNG/Sync/Dr-Copied-OutThere/ \
            SAMSUNG/Sync/Dr-JH-Copied/ \
            SAMSUNG/Sync/Dr-JH-F+F/ \
            SAMSUNG/Sync/Dr-JH-IT_stack/ \
            SAMSUNG/Sync/Dr-JH-Now/ \
            SAMSUNG/Sync/Dr-JH-Stack/ \
            SAMSUNG/Sync/Dr-JH-Theatre0/ \
            SAMSUNG/Sync/Dr-JH-Theatre1/ \
            SAMSUNG/Sync/Dr-JH-Then0/ \
            SAMSUNG/Sync/Dr-JH-Then1/ \
            SAMSUNG/Sync/Dr-JH-toReduce/ \
            SAMSUNG/Sync/Dr-JH-Work/ \
            SAMSUNG/Sync/Dr-Photos/ \
            SAMSUNG/Sync/IT-Copied/ \
            SAMSUNG/Sync/IT-DebianBased-Copied/ \
            SAMSUNG/Sync/More/ )

# List the included directories:
echo -en "This BASH script will run \e[1mrsync\e[0m, pushing all changes, "
echo "either to or from these local directories:"
i=-1
for thisdir in "${intdir[@]}"; do
    if [ ! $thisdir = "-" ]; then
        ((i++))
        if [ ${include[i]} -ne "0" ]; then echo -en "\e[92m  $thisdir\n"; fi
    fi
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
        if [ ! $thisdir = "-" ]; then
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
            echo "Push sync $((i+1))" | tee -a $outf1
            echo "-----------" | tee -a $outf1
            echo $fullcmd | tee -a $outf1
            echo "" | tee -a $outf1
            $fullcmd | tee -a $outf1 # - disable for testing
        fi
    fi
done
jHM=$(date "+%j-%H%M")
outf2="$outf0-$jHM.txt"
cp $outf1 $outf2
echo "- all done, and logged to $outf1 (& $outf2)"
exit

