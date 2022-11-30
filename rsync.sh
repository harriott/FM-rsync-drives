#!/bin/bash

# Joseph Harriott - Sun 02 Oct 2022

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------
#   As this script performs a high-impact operation,
#   I prefer to leave it without executable permission
#   and call it from a terminal with the bash command.
#   eg: bash /<fullpath>/rsync.sh

# rpd  is defined in my  $Bash/bashrc-ob

# createTarget=1  # usually commented out

#=> 0 directory locations
# $Drpbx  is defined in my  $ARCHBUILDS/Bash/export-storage
extmnt=/run/media/jo
scriptDir=$( dirname "${BASH_SOURCE[0]}" )

#==> includes 0 abstracted list of included locations
# set first item to 0 to exclude a directory:
includeIndexed=(
  1 1-Dr-JH-Cafezoide
  1 1-Dr-JH-CforWork
  1 1-Dr-JH-copied
  1 1-Dr-JH-core
  1 1-Dr-JH-F+F
  1 1-Dr-JH-JCD-imagey-e3
  1 1-Dr-JH-now
  1 1-Dr-JH-Sh-AsusW202
  1 1-Dr-JH-Sh-sbMb
  1 1-Dr-JH-Sh-XA10II
  1 1-Dr-JH-stack
  1 1-Dr-JH-T91-default-release
  1 1-Dr-JH-technos
  1 1-Dr-JH-Theatre0
  1 1-Dr-JH-Theatre1
  1 1-Dr-JH-Then0
  1 1-Dr-JH-Then1
  1 1-Dr-JH-WimHof-guides
  1 1-Dr-JH-work
  1 1-Dr-Photos
  1 2-Dr-Apps
  1 2-Dr-CAM-best
  1 2-Dr-CAM-good
  1 2-Dr-CAM-toSort0
  1 2-Dr-CAM-toSort1
  1 2-Dr-CAM-toSort1-UK
  1 2-Dr-CAM-toSort1-USA
  1 2-Dr-CAT-Buddhism
  1 2-Dr-CAT-OutThere
  1 2-Dr-CAT-OutThere-UK
  1 2-Dr-CAT-Wellbeing
  1 2-Dr-COutThere
  1 3-IT-Copied
  1 3-Sync2
)  # this list defines the sort order

#==> includes 1 make the include array
source $scriptDir/rsync-makeIncludeArray.sh

#==> source locations on machines
# $host  is defined in  $ARCHBUILDS/Bash/export-storage

#===> AsusW202
if [ $host = "AsusW202" ]; then
    dirSource=(
        $Cfzd
        $Drpbx/JH/CforWork
        $Drpbx/JH/copied
        $Drpbx/JH/core
        $Drpbx/JH/F+F
        $Drpbx/JH/JCD-imagey-e3
        $Drpbx/JH/now
        $Drpbx/JH/Sh-AsusW202
        $Drpbx/JH/Sh-sbMb
        $Drpbx/JH/Sh-XA10II
        $Drpbx/JH/stack
        $Drpbx/JH/T91-default-release
        $Drpbx/JH/technos
        $Drpbx/JH/Theatre0
        $Drpbx/JH/Theatre1
        $Drpbx/JH/Then0
        $Drpbx/JH/Then1
        $Drpbx/JH/WimHof-guides
        $Drpbx/JH/work
        $Drpbx/Photos
        $Drpbx/Apps
        $Drpbx/CAM-best
        $Drpbx/CAM-good
        $Drpbx/CAM-toSort0
        -
        -
        -
        -
        -
        -
        -
        $Drpbx/COutThere
        -
        -
    )
fi  # $host  is defined in  $ARCHBUILDS/Bash/export-storage

#===> i34G1TU02
if [ $host = "i34G1TU02" ]; then
    dirSource=(
        $Cfzd
        $Drpbx/JH/CforWork
        $Drpbx/JH/copied
        $Drpbx/JH/core
        $Drpbx/JH/F+F
        $Drpbx/JH/JCD-imagey-e3
        $Drpbx/JH/now
        $Drpbx/JH/Sh-AsusW202
        $Drpbx/JH/Sh-sbMb
        $Drpbx/JH/Sh-XA10II
        $Drpbx/JH/stack
        $Drpbx/JH/T91-default-release
        $Drpbx/JH/technos
        $Drpbx/JH/Theatre0
        $Drpbx/JH/Theatre1
        $Drpbx/JH/Then0
        $Drpbx/JH/Then1
        $Drpbx/JH/WimHof-guides
        $Drpbx/JH/work
        $Drpbx/Photos
        $Drpbx/Apps
    )
fi  # $host  is defined in  $ARCHBUILDS/Bash/export-storage

#===> sbMb
if [ $host = "sbMb" ]; then
    dirSource=(
        $Cfzd
        $Drpbx/JH/CforWork
        $Drpbx/JH/copied
        $Drpbx/JH/core
        $Drpbx/JH/F+F
        $Drpbx/JH/JCD-imagey-e3
        $Drpbx/JH/now
        $Drpbx/JH/Sh-AsusW202
        $Drpbx/JH/Sh-sbMb
        $Drpbx/JH/Sh-XA10II
        $Drpbx/JH/stack
        $Drpbx/JH/T91-default-release
        $Drpbx/JH/technos
        $Drpbx/JH/Theatre0
        $Drpbx/JH/Theatre1
        $Drpbx/JH/Then0
        $Drpbx/JH/Then1
        $Drpbx/JH/WimHof-guides
        $Drpbx/JH/work
        $Drpbx/Photos
        $Drpbx/Apps
        $Drpbx/CAM-best
        $Drpbx/CAM-good
        $Drpbx/CAM-toSort0
        $Drpbx/CAM-toSort1
        $Drpbx/CAM-toSort1-UK
        $Drpbx/CAM-toSort1-USA
        $Drpbx/CAT-Buddhism
        $Drpbx/CAT-OutThere
        $Drpbx/CAT-OutThere-UK
        $Drpbx/CAT-Wellbeing
        $Drpbx/COutThere
        /mnt/SDU3D1TB/IT-Copied
        /mnt/SDU3D1TB/Sync2
    )
fi  # $host  is defined in  $ARCHBUILDS/Bash/export-storage

#==> target locations on portable drives
dirTarget=(
  WD30EZRZ/Sync0Dr/JH-Cafezoide
  WD30EZRZ/Sync0Dr/JH-CforWork
  WD30EZRZ/Sync0Dr/JH-copied
  WD30EZRZ/Sync0Dr/JH-core
  WD30EZRZ/Sync0Dr/JH-F+F
  WD30EZRZ/Sync0Dr/JH-JCD-imagey-e3
  WD30EZRZ/Sync0Dr/JH-now
  WD30EZRZ/Sync0Dr/JH-Sh-AsusW202
  WD30EZRZ/Sync0Dr/JH-Sh-sbMb
  WD30EZRZ/Sync0Dr/JH-Sh-XA10II
  WD30EZRZ/Sync0Dr/JH-stack
  WD30EZRZ/Sync0Dr/JH-T91-default-release
  WD30EZRZ/Sync0Dr/JH-technos
  WD30EZRZ/Sync0Dr/JH-Theatre0
  WD30EZRZ/Sync0Dr/JH-Theatre1
  WD30EZRZ/Sync0Dr/JH-Then0
  WD30EZRZ/Sync0Dr/JH-Then1
  WD30EZRZ/Sync0Dr/JH-WimHof-guides
  WD30EZRZ/Sync0Dr/JH-work
  WD30EZRZ/Sync0Dr/Photos
  WD30EZRZ/Sync1Dr/Apps
  WD30EZRZ/Sync1Dr/CAM-best
  WD30EZRZ/Sync1Dr/CAM-good
  WD30EZRZ/Sync1Dr/CAM-toSort0
  WD30EZRZ/Sync1Dr/CAM-toSort1
  WD30EZRZ/Sync1Dr/CAM-toSort1-UK
  WD30EZRZ/Sync1Dr/CAM-toSort1-USA
  WD30EZRZ/Sync1Dr/CAT-Buddhism
  WD30EZRZ/Sync1Dr/CAT-OutThere
  WD30EZRZ/Sync1Dr/CAT-OutThere-UK
  WD30EZRZ/Sync1Dr/CAT-Wellbeing
  WD30EZRZ/Sync1Dr/COutThere
  WD30EZRZ/IT-Copied
  WD30EZRZ/Sync2
)

#=> 1 list the included directories
echo -en "This BASH script will run \e[1mrsync\e[0m, pushing all changes, "
echo -e "either to or from these local directories:\e[92m"
source "$scriptDir/rsync-list_included.sh"

#=> 2 decide what to do
if [ $1 ]; then
    drctn=$1
else
    read -p "Sync TO (T) portable drives (or dry-run (t)), or FROM (F) (or dry-run (f))? " drctn
fi
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

