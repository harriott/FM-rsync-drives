#!/bin/bash

# Joseph Harriott - Tue 26 Apr 2022

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------
#   As this script performs a high-impact operation,
#   I prefer to leave it without executable permission
#   and call it from a terminal with the bash command.
#   eg: bash /<fullpath>/rsync.sh

# alias rpd  is defined in my  $Bash/bashrc-ob

#=> 0 directory locations
# $DROPBOX  is defined in my  $ARCHBUILDS/Bash/export-storage
extmnt=/run/media/jo
scriptDir=$( dirname "${BASH_SOURCE[0]}" )

#==> includes 0 abstracted list of included locations
# set first item to 0 to exclude a directory:
includeIndexed=(
  1 1-Dr-JH-Cafezoide \
  1 1-Dr-JH-CforWork \
  1 1-Dr-JH-copied \
  1 1-Dr-JH-core \
  1 1-Dr-JH-F+F \
  1 1-Dr-JH-JCD-imagey-e3 \
  1 1-Dr-JH-now \
  1 1-Dr-JH-Sh-LIP120s81A4 \
  1 1-Dr-JH-Sh-sbMb \
  1 1-Dr-JH-Sh-XA10II \
  1 1-Dr-JH-Sh-XA2 \
  1 1-Dr-JH-Sh-XA2-ss \
  1 1-Dr-JH-stack \
  1 1-Dr-JH-T91-default-release \
  1 1-Dr-JH-technos \
  1 1-Dr-JH-Theatre0 \
  1 1-Dr-JH-Theatre1 \
  1 1-Dr-JH-Then0 \
  1 1-Dr-JH-Then1 \
  1 1-Dr-JH-toReduce \
  1 1-Dr-JH-work \
  1 1-Dr-Photos \
  1 2-Dr-Apps \
  1 2-Dr-CAM-best \
  1 2-Dr-CAM-good \
  1 2-Dr-CAM-toSort0 \
  1 2-Dr-CAM-toSort1 \
  1 2-Dr-CAM-toSort1-UK \
  1 2-Dr-CAM-toSort1-USA \
  1 2-Dr-CAT-Buddhism \
  1 2-Dr-CAT-OutThere \
  1 2-Dr-CAT-OutThere-UK \
  1 2-Dr-CAT-Wellbeing \
  1 2-Dr-COutThere \
  1 3-IT-Copied \
  1 3-Sync2 \
)  # this list defines the sort order

#==> includes 1 make the include array
source $scriptDir/rsync-makeIncludeArray.sh

#==> source locations on i34G1TU02
if [ $host = "i34G1TU02" ]; then
    dirSource=(
        "$DROPBOX/JH/Cafezoide/" \
        "$DROPBOX/JH/CforWork/" \
        "$DROPBOX/JH/copied/" \
        "$DROPBOX/JH/core/" \
        "$DROPBOX/JH/F+F/" \
        "$DROPBOX/JH/JCD-imagey-e3/" \
        "$DROPBOX/JH/now/" \
        "$DROPBOX/JH/Sh-LIP120s81A4/" \
        "$DROPBOX/JH/Sh-sbMb/" \
        "$DROPBOX/JH/Sh-XA10II/" \
        "$DROPBOX/JH/Sh-XA2/" \
        "$DROPBOX/JH/Sh-XA2-ss/" \
        "$DROPBOX/JH/stack/" \
        "$DROPBOX/JH/T91-default-release/" \
        "$DROPBOX/JH/technos/" \
        "$DROPBOX/JH/Theatre0/" \
        "$DROPBOX/JH/Theatre1/" \
        "$DROPBOX/JH/Then0/" \
        "$DROPBOX/JH/Then1/" \
        "$DROPBOX/JH/toReduce/" \
        "$DROPBOX/JH/work/" \
        "$DROPBOX/Photos/" \
        "$DROPBOX/Apps/" \
    )
fi  # $host  is defined in  $ARCHBUILDS/Bash/export-storage

#==> source locations on sbMb
if [ $host = "sbMb" ]; then
    dirSource=(
        $DROPBOX/JH/Cafezoide \
        $DROPBOX/JH/CforWork \
        $DROPBOX/JH/copied \
        $DROPBOX/JH/core \
        $DROPBOX/JH/F+F \
        $DROPBOX/JH/JCD-imagey-e3 \
        $DROPBOX/JH/now \
        $DROPBOX/JH/Sh-LIP120s81A4 \
        $DROPBOX/JH/Sh-sbMb \
        $DROPBOX/JH/Sh-XA10II \
        $DROPBOX/JH/Sh-XA2 \
        $DROPBOX/JH/Sh-XA2-ss \
        $DROPBOX/JH/stack \
        $DROPBOX/JH/T91-default-release \
        $DROPBOX/JH/technos \
        $DROPBOX/JH/Theatre0 \
        $DROPBOX/JH/Theatre1 \
        $DROPBOX/JH/Then0 \
        $DROPBOX/JH/Then1 \
        $DROPBOX/JH/toReduce \
        $DROPBOX/JH/work \
        $DROPBOX/Photos \
        $DROPBOX/Apps \
        $DROPBOX/CAM-best \
        $DROPBOX/CAM-good \
        $DROPBOX/CAM-toSort0 \
        $DROPBOX/CAM-toSort1 \
        $DROPBOX/CAM-toSort1-UK \
        $DROPBOX/CAM-toSort1-USA \
        $DROPBOX/CAT-Buddhism \
        $DROPBOX/CAT-OutThere \
        $DROPBOX/CAT-OutThere-UK \
        $DROPBOX/CAT-Wellbeing \
        $DROPBOX/COutThere \
        /mnt/SDU3D1TB/IT-Copied \
        /mnt/SDU3D1TB/Sync2 \
    )
fi  # $host  is defined in  $ARCHBUILDS/Bash/export-storage

#==> target locations on portable drives
dirTarget=(
  SM3/Sync0Dr/JH-Cafezoide \
  SM3/Sync0Dr/JH-CforWork \
  SM3/Sync0Dr/JH-copied \
  SM3/Sync0Dr/JH-core \
  SM3/Sync0Dr/JH-F+F \
  SM3/Sync0Dr/JH-JCD-imagey-e3 \
  SM3/Sync0Dr/JH-now \
  SM3/Sync0Dr/JH-Sh-LIP120s81A4 \
  SM3/Sync0Dr/JH-Sh-sbMb \
  SM3/Sync0Dr/JH-Sh-XA10II \
  SM3/Sync0Dr/JH-Sh-XA2 \
  SM3/Sync0Dr/JH-Sh-XA2-ss \
  SM3/Sync0Dr/JH-stack \
  SM3/Sync0Dr/JH-T91-default-release \
  SM3/Sync0Dr/JH-technos \
  SM3/Sync0Dr/JH-Theatre0 \
  SM3/Sync0Dr/JH-Theatre1 \
  SM3/Sync0Dr/JH-Then0 \
  SM3/Sync0Dr/JH-Then1 \
  SM3/Sync0Dr/JH-toReduce \
  SM3/Sync0Dr/JH-work \
  SM3/Sync0Dr/Photos \
  SM3/Sync1Dr/Apps \
  SM3/Sync1Dr/CAM-best \
  SM3/Sync1Dr/CAM-good \
  SM3/Sync1Dr/CAM-toSort0 \
  SM3/Sync1Dr/CAM-toSort1 \
  SM3/Sync1Dr/CAM-toSort1-UK \
  SM3/Sync1Dr/CAM-toSort1-USA \
  SM3/Sync1Dr/CAT-Buddhism \
  SM3/Sync1Dr/CAT-OutThere \
  SM3/Sync1Dr/CAT-OutThere-UK \
  SM3/Sync1Dr/CAT-Wellbeing \
  SM3/Sync1Dr/COutThere \
  SM3/IT-Copied \
  SM3/Sync2 \
)

#=> 1 list the included directories
echo -en "This BASH script will run \e[1mrsync\e[0m, pushing all changes, "
echo -e "either to or from these local directories:\e[92m"
source "$scriptDir/rsync-list_included.sh"

#=> 2 decide what to do
read -p "Sync TO (T) portable drives (or dry-run (t)), or FROM (F) (or dry-run (f))? " drctn
if [ $drctn ]; then
    dr0=''
    dr1=''
    if [ $drctn = "T" ]; then
        read -p "Run several: ${tpf7b}$rsynccom <localdrive> <portabledrive> ? ${tpfn}" cnfrm
    elif [ $drctn = "t" ]; then
        dr0='n'  # rsync's dry-run switch
        dr1=' - dry-run'
        echo "Okay, running: ${tpf7b}$rsynccom <localdrive> <portabledrivebackup>${tpfn}"
        cnfrm="y"
    elif [ $drctn = "F" ]; then
        echo "About to run several: ${tpf5b}$rsynccom <portabledrive> <localdrive>${tpfn}"
        read -p "No recovery possible from this operation, GO AHEAD? " cnfrm
    elif [ $drctn = "f" ]; then
        dr0='n'  # rsync's dry-run switch
        dr1=' - dry-run'
        echo -e "Okay, running: \e[1m$rsynccom <portabledrivebackup> <localdrive>\e[0m"
        cnfrm="y"
    else
        exit
    fi
    if [ ! $cnfrm ] || [ $cnfrm != "y" ]; then exit; fi
    rsynccom="rsync -ilrt$dr0 --delete"
else
    exit
fi

#=> 3 do it
outf=`basename ${BASH_SOURCE[0]}`
source "$scriptDir/rsync-do_it.sh"

