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
  0 0-Dr-JH-Cafezoide \
  0 0-Dr-JH-CforWork \
  0 0-Dr-JH-copied \
  1 0-Dr-JH-core \
  0 0-Dr-JH-F+F \
  0 0-Dr-JH-JCD-imagey-e3 \
  0 0-Dr-JH-now \
  0 0-Dr-JH-Sh-81A4 \
  0 0-Dr-JH-Sh-XA10II \
  0 0-Dr-JH-Sh-XA2 \
  0 0-Dr-JH-stack \
  0 0-Dr-JH-technos \
  0 0-Dr-JH-Theatre0 \
  0 0-Dr-JH-Theatre1 \
  0 0-Dr-JH-Then0 \
  0 0-Dr-JH-Then1 \
  0 0-Dr-JH-toReduce \
  0 0-Dr-JH-T91-default-release \
  0 0-Dr-JH-work \
  0 0-Dr-Photos \
  0 1-Dr-Apps \
  0 1-Dr-CAM-best \
  0 1-Dr-CAM-good \
  0 1-Dr-CAM-toSort0 \
  0 1-Dr-CAM-toSort1 \
  0 1-Dr-CAM-toSort1-UK \
  0 1-Dr-CAM-toSort1-USA \
  0 1-Dr-COutThere \
  0 2-Sync2 \
  0 2-Dr-CAT-Buddhism \
  0 2-Dr-CAT-OutThere \
  0 2-Dr-CAT-OutThere-UK \
  0 2-IT-Copied \
  0 3-Vs-do \
  1 3-Vs-educate \
  1 3-Vs-forChildren \
  0 3-Vs-forChildren-best \
  0 3-Vs-forChildren-best-Europe \
  0 3-Vs-forChildren-best-US \
  0 3-Vs-forChildren-unseen \
  0 3-Vs-inform-arts \
  0 3-Vs-inform-belief \
  0 3-Vs-inform-history \
  0 3-Vs-inform-other \
  0 3-Vs-inform-technos \
  0 3-Vs-inform-war \
  0 3-Vs-literature \
  0 3-Vs-nature \
  0 3-Vs-story \
  0 3-Vs-story-favs \
  0 3-Vs-story-favs-US \
  0 3-Vs-story-fun \
  0 3-Vs-story-unseen \
  0 3-Vs-story-US \
  0 3-Vs-story-war \
  0 3-Vs-theatre \
)
# VsPreferred=TOSHIBA
VsPreferred=HD103SJ

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
        "$DROPBOX/JH/Sh-81A4/" \
        "$DROPBOX/JH/Sh-XA10II/" \
        "$DROPBOX/JH/Sh-XA2/" \
        "$DROPBOX/JH/stack/" \
        "$DROPBOX/JH/technos/" \
        "$DROPBOX/JH/Theatre0/" \
        "$DROPBOX/JH/Theatre1/" \
        "$DROPBOX/JH/Then0/" \
        "$DROPBOX/JH/Then1/" \
        "$DROPBOX/JH/toReduce/" \
        "$DROPBOX/JH/T91-default-release/" \
        "$DROPBOX/JH/work/" \
        "$DROPBOX/Photos/" \
        "$DROPBOX/Apps/" \
    )
fi  # $host  is defined in  $ARCHBUILDS/Bash/export-storage

#==> source locations on sbMb
if [ $host = "sbMb" ]; then
    dirSource=(
        "$DROPBOX/JH/Cafezoide/" \
        "$DROPBOX/JH/CforWork/" \
        "$DROPBOX/JH/copied/" \
        "$DROPBOX/JH/core/" \
        "$DROPBOX/JH/F+F/" \
        "$DROPBOX/JH/JCD-imagey-e3/" \
        "$DROPBOX/JH/now/" \
        "$DROPBOX/JH/Sh-81A4/" \
        "$DROPBOX/JH/Sh-XA10II/" \
        "$DROPBOX/JH/Sh-XA2/" \
        "$DROPBOX/JH/stack/" \
        "$DROPBOX/JH/technos/" \
        "$DROPBOX/JH/Theatre0/" \
        "$DROPBOX/JH/Theatre1/" \
        "$DROPBOX/JH/Then0/" \
        "$DROPBOX/JH/Then1/" \
        "$DROPBOX/JH/toReduce/" \
        "$DROPBOX/JH/T91-default-release/" \
        "$DROPBOX/JH/work/" \
        "$DROPBOX/Photos/" \
        "$DROPBOX/Apps/" \
        "$DROPBOX/CAM-best/" \
        "$DROPBOX/CAM-good/" \
        "$DROPBOX/CAM-toSort0/" \
        "$DROPBOX/CAM-toSort1/" \
        "$DROPBOX/CAM-toSort1-UK/" \
        "$DROPBOX/CAM-toSort1-USA/" \
        "$DROPBOX/COutThere/" \
        "/mnt/WD30EZRZ/Sync2/" \
        "/mnt/WD30EZRZ/Dr-CAT-Buddhism/" \
        "$DROPBOX/CAT-OutThere/" \
        "$DROPBOX/CAT-OutThere-UK/" \
        "/mnt/WD30EZRZ/IT-Copied/" \
        "/mnt/WD30EZRZ/Vs-do/" \
        "/mnt/WD30EZRZ/Vs-educate/" \
        "/mnt/ST4000VN008/Vs-forChildren/" \
        "/mnt/WD30EZRZ/Vs-forChildren-best/" \
        "/mnt/WD30EZRZ/Vs-forChildren-best-Europe/" \
        "/mnt/WD30EZRZ/Vs-forChildren-best-US/" \
        "/mnt/ST4000VN008/Vs-forChildren-unseen/" \
        "/mnt/ST4000VN008/Vs-inform-arts/" \
        "/mnt/ST4000VN008/Vs-inform-belief/" \
        "/mnt/ST4000VN008/Vs-inform-history/" \
        "/mnt/ST4000VN008/Vs-inform-other/" \
        "/mnt/ST4000VN008/Vs-inform-technos/" \
        "/mnt/ST4000VN008/Vs-inform-war/" \
        "/mnt/ST4000VN008/Vs-literature/" \
        "/mnt/ST4000VN008/Vs-nature/" \
        "/mnt/ST4000VN008/Vs-story/" \
        "/mnt/ST4000VN008/Vs-story-favs/" \
        "/mnt/ST4000VN008/Vs-story-favs-US/" \
        "/mnt/ST4000VN008/Vs-story-fun/" \
        "/mnt/ST4000VN008/Vs-story-unseen/" \
        "/mnt/ST4000VN008/Vs-story-US/" \
        "/mnt/ST4000VN008/Vs-story-war/" \
        "/mnt/ST4000VN008/Vs-theatre/" \
    )
fi  # $host  is defined in  $ARCHBUILDS/Bash/export-storage

#==> target locations on portable drives
# this list defines the sort order
dirTarget=(
  SM3/Sync0Dr/JH-Cafezoide/ \
  SM3/Sync0Dr/JH-CforWork/ \
  SM3/Sync0Dr/JH-copied/ \
  SM3/Sync0Dr/JH-core/ \
  SM3/Sync0Dr/JH-F+F/ \
  SM3/Sync0Dr/JH-JCD-imagey-e3/ \
  SM3/Sync0Dr/JH-now/ \
  SM3/Sync0Dr/JH-Sh-81A4/ \
  SM3/Sync0Dr/JH-Sh-XA10II/ \
  SM3/Sync0Dr/JH-Sh-XA2/ \
  SM3/Sync0Dr/JH-stack/ \
  SM3/Sync0Dr/JH-technos/ \
  SM3/Sync0Dr/JH-Theatre0/ \
  SM3/Sync0Dr/JH-Theatre1/ \
  SM3/Sync0Dr/JH-Then0/ \
  SM3/Sync0Dr/JH-Then1/ \
  SM3/Sync0Dr/JH-toReduce/ \
  SM3/Sync0Dr/JH-T91-default-release/ \
  SM3/Sync0Dr/JH-work/ \
  SM3/Sync0Dr/Photos/ \
  SM3/Sync1Dr/Apps/ \
  SM3/Sync1Dr/CAM-best \
  SM3/Sync1Dr/CAM-good \
  SM3/Sync1Dr/CAM-toSort0/ \
  SM3/Sync1Dr/CAM-toSort1/ \
  SM3/Sync1Dr/CAM-toSort1-UK \
  SM3/Sync1Dr/CAM-toSort1-USA \
  SM3/Sync1Dr/COutThere/ \
  SM3/Sync2/ \
  SM3/Dr-CAT-Buddhism/ \
  SM3/Dr-CAT-OutThere \
  SM3/Dr-CAT-OutThere-UK \
  SM3/IT-Copied/ \
  TOSHIBA/Vs-do/ \
  TOSHIBA/Vs-educate/ \
  SM3/Vs-forChildren/ \
  TOSHIBA/Vs-forChildren-best/ \
  TOSHIBA/Vs-forChildren-best-Europe/ \
  TOSHIBA/Vs-forChildren-best-US/ \
  TOSHIBA/Vs-forChildren-unseen/ \
  TOSHIBA/Vs-inform-arts/ \
  TOSHIBA/Vs-inform-belief/ \
  TOSHIBA/Vs-inform-history/ \
  TOSHIBA/Vs-inform-other/ \
  TOSHIBA/Vs-inform-technos/ \
  SM3/Vs-inform-war/ \
  SM3/Vs-literature/ \
  TOSHIBA/Vs-nature/ \
  TOSHIBA/Vs-story/ \
  TOSHIBA/Vs-story-favs/ \
  TOSHIBA/Vs-story-favs-US/ \
  TOSHIBA/Vs-story-fun/ \
  TOSHIBA/Vs-story-unseen/ \
  TOSHIBA/Vs-story-US/ \
  TOSHIBA/Vs-story-war/ \
  TOSHIBA/Vs-theatre/ \
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
    # rsynccom="rsync -ilrt --delete"
    if [ $drctn = "T" ]; then
        read -p "Run several: ${tpf7b}$rsynccom <localdrive> <portabledrive> ? ${tpfn}" cnfrm
    elif [ $drctn = "t" ]; then
        dr0='n'  # rsync's dry-run switch
        dr1=' - dry-run'
        # rsynccom="rsync -ilnrt --delete" # dry-run
        echo "Okay, running: ${tpf7b}$rsynccom <localdrive> <portabledrivebackup>${tpfn}"
        cnfrm="y"
    elif [ $drctn = "F" ]; then
        echo "About to run several: ${tpf5b}$rsynccom <portabledrive> <localdrive>${tpfn}"
        read -p "No recovery possible from this operation, GO AHEAD? " cnfrm
    elif [ $drctn = "f" ]; then
        dr0='n'  # rsync's dry-run switch
        dr1=' - dry-run'
        # rsynccom="rsync -ilnrt --delete" # dry-run
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

