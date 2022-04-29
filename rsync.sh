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

#==> include list
source "$scriptDir/include0.sh"

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
        "$DROPBOX/JH/Stack/" \
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
        "$DROPBOX/JH/Stack/" \
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
        "$DROPBOX/CAM-favs/" \
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
        "/mnt/ST4000VN008/Vs-do/" \
        "/mnt/ST4000VN008/Vs-forChildren-best/" \
        "/mnt/ST4000VN008/Vs-forChildren-best-Europe/" \
        "/mnt/ST4000VN008/Vs-forChildren-best-US/" \
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
  SM3/Sync0Dr/JH-Stack/ \
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
  SM3/Sync1Dr/CAM-favs \
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
  TOSHIBA/Vs-forChildren-best/ \
  TOSHIBA/Vs-forChildren-best-Europe/ \
  TOSHIBA/Vs-forChildren-best-US/ \
  TOSHIBA/Vs-forChildren-unseen/ \
  TOSHIBA/Vs-inform-arts/ \
  TOSHIBA/Vs-inform-belief/ \
  TOSHIBA/Vs-inform-history/ \
  TOSHIBA/Vs-inform-other/ \
  TOSHIBA/Vs-inform-technos/ \
  TOSHIBA/Vs-inform-war/ \
  TOSHIBA/Vs-literature/ \
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

#=> 2 ask what to do
read -p "Sync TO (T) portable drives (or dry-run (t)), or FROM (F) (or dry-run (f))? " drctn
if [ $drctn ]; then
    dryrun=''
    rsynccom="rsync -ilrt --delete"
    if [ $drctn = "T" ]; then
        read -p "Run several: ${tpf7b}$rsynccom <localdrive> <portabledrive> ? ${tpfn}" cnfrm
    elif [ $drctn = "t" ]; then
        dryrun=' - dry-run'
        rsynccom="rsync -ilnrt --delete" # dry-run
        echo "Okay, running: ${tpf7b}$rsynccom <localdrive> <portabledrivebackup>${tpfn}"
        cnfrm="y"
    elif [ $drctn = "F" ]; then
        echo "About to run several: ${tpf5b}$rsynccom <portabledrive> <localdrive>${tpfn}"
        read -p "No recovery possible from this operation, GO AHEAD? " cnfrm
    elif [ $drctn = "f" ]; then
        dryrun=' - dry-run'
        rsynccom="rsync -ilnrt --delete" # dry-run
        echo -e "Okay, running: \e[1m$rsynccom <portabledrivebackup> <localdrive>\e[0m"
        cnfrm="y"
    else
        exit
    fi
    if [ ! $cnfrm ] || [ $cnfrm != "y" ]; then exit; fi
else
    exit
fi

#=> 3 do it
outf=`basename ${BASH_SOURCE[0]}`
source "$scriptDir/rsync-do_it.sh"

