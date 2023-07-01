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
# $Drpbx  is defined in my  $OSAB/Bash/export-storage
extmnt=/run/media/jo
scriptDir=$( dirname "${BASH_SOURCE[0]}" )

#==> includes 0 abstracted list of included locations
# set first item to 0 to exclude a directory:
includeIndexed=(
  0 1-Dr-JH-Cafezoide
  0 1-Dr-JH-CforWork
  0 1-Dr-JH-copied
  0 1-Dr-JH-core
  0 1-Dr-JH-F+F
  0 1-Dr-JH-JCD-imagey-e3
  0 1-Dr-JH-now
  0 1-Dr-JH-Sh-AsusW202
  0 1-Dr-JH-Sh-OppoA76
  0 1-Dr-JH-Sh-sbMb
  0 1-Dr-JH-Sh-XA10II
  0 1-Dr-JH-stack
  0 1-Dr-JH-T91-default-release
  0 1-Dr-JH-technos
  0 1-Dr-JH-Theatre0
  0 1-Dr-JH-Theatre1
  0 1-Dr-JH-Then0
  0 1-Dr-JH-Then1
  0 1-Dr-JH-work
  0 1-Dr-Photos
  0 2-Dr-Apps
  0 2-Dr-CAM-best
  0 2-Dr-CAM-good
  0 2-Dr-CAM-joy
  0 2-Dr-CAM-toSort0
  0 2-Dr-CAM-toSort1
  0 2-Dr-CAM-toSort1-UK
  0 2-Dr-CAM-toSort1-USA
  0 2-Dr-CAT-Buddhism
  0 2-Dr-CAT-OutThere
  0 2-Dr-CAT-OutThere-UK
  0 2-Dr-CAT-Wellbeing
  0 2-Dr-COutThere
  0 2-Dr-Vs-WimHof-guides
  0 3-IT-Copied
  1 3-Sync2
)  # this list defines the sort order

#==> includes 1 make the include array
source $scriptDir/rsync-makeIncludeArray.sh

#==> source locations on machines
# $host  is defined in  $OSAB/Bash/export-storage

#===> AsusW202
if [ $host = "AsusW202" ]; then
    dirSource=(
        $Cfzd
        $DJH/CforWork
        $DJH/copied
        $DJH/core
        $DJH/F+F
        $DJH/JCD-imagey-e3
        $DJH/now
        $DJH/Sh-AsusW202
        $DJH/Sh-OppoA76
        $DJH/Sh-sbMb
        $DJH/Sh-XA10II
        $DJH/stack
        $DJH/T91-default-release
        $DJH/technos
        $DJH/Theatre0
        $DJH/Theatre1
        $DJH/Then0
        $DJH/Then1
        $JHw
        $Drpbx/Photos
        $Drpbx/Apps
        $Drpbx/CAM-best
        $Drpbx/CAM-good
        $Drpbx/CAM-joy
        $Drpbx/CAM-toSort0
        -
        -
        -
        -
        -
        -
        -
        $Drpbx/COutThere
        $Drpbx/Vs-WimHof-guides
        -
        -
    )
fi  # $host  is defined in  $OSAB/Bash/export-storage

#===> i34G1TU02
if [ $host = "i34G1TU02" ]; then
    dirSource=(
        $Cfzd
        $DJH/CforWork
        $DJH/copied
        $DJH/core
        $DJH/F+F
        $DJH/JCD-imagey-e3
        $DJH/now
        $DJH/Sh-AsusW202
        $DJH/Sh-OppoA76
        $DJH/Sh-sbMb
        $DJH/Sh-XA10II
        $DJH/stack
        $DJH/T91-default-release
        $DJH/technos
        $DJH/Theatre0
        $DJH/Theatre1
        $DJH/Then0
        $DJH/Then1
        $JHw
        $Drpbx/Photos
        $Drpbx/Apps
        -
        -
        -
        -
        -
        -
        -
        -
        -
        -
        -
        $Drpbx/Vs-WimHof-guides
        -
        -
    )
fi  # $host  is defined in  $OSAB/Bash/export-storage

#===> sbMb
if [ $host = "sbMb" ]; then
    dirSource=(
        $Cfzd
        $DJH/CforWork
        $DJH/copied
        $DJH/core
        $DJH/F+F
        $DJH/JCD-imagey-e3
        $DJH/now
        $DJH/Sh-AsusW202
        $DJH/Sh-OppoA76
        $DJH/Sh-sbMb
        $DJH/Sh-XA10II
        $DJH/stack
        $DJH/T91-default-release
        $DJH/technos
        $DJH/Theatre0
        $DJH/Theatre1
        $DJH/Then0
        $DJH/Then1
        $JHw
        $Drpbx/Photos
        $Drpbx/Apps
        $Drpbx/CAM-best
        $Drpbx/CAM-good
        $Drpbx/CAM-joy
        $Drpbx/CAM-toSort0
        $Drpbx/CAM-toSort1
        $Drpbx/CAM-toSort1-UK
        $Drpbx/CAM-toSort1-USA
        $Drpbx/CAT-Buddhism
        $Drpbx/CAT-OutThere
        $Drpbx/CAT-OutThere-UK
        $Drpbx/CAT-Wellbeing
        $Drpbx/COutThere
        $Drpbx/Vs-WimHof-guides
        /mnt/SDU3D1TB/IT-Copied
        /mnt/SDU3D1TB/Sync2
    )
fi  # $host  is defined in  $OSAB/Bash/export-storage

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
  WD30EZRZ/Sync0Dr/JH-Sh-OppoA76
  WD30EZRZ/Sync0Dr/JH-Sh-sbMb
  WD30EZRZ/Sync0Dr/JH-Sh-XA10II
  WD30EZRZ/Sync0Dr/JH-stack
  WD30EZRZ/Sync0Dr/JH-T91-default-release
  WD30EZRZ/Sync0Dr/JH-technos
  WD30EZRZ/Sync0Dr/JH-Theatre0
  WD30EZRZ/Sync0Dr/JH-Theatre1
  WD30EZRZ/Sync0Dr/JH-Then0
  WD30EZRZ/Sync0Dr/JH-Then1
  WD30EZRZ/Sync0Dr/JH-work
  WD30EZRZ/Sync0Dr/Photos
  WD30EZRZ/Sync1Dr/Apps
  WD30EZRZ/Sync1Dr/CAM-best
  WD30EZRZ/Sync1Dr/CAM-good
  WD30EZRZ/Sync1Dr/CAM-joy
  WD30EZRZ/Sync1Dr/CAM-toSort0
  WD30EZRZ/Sync1Dr/CAM-toSort1
  WD30EZRZ/Sync1Dr/CAM-toSort1-UK
  WD30EZRZ/Sync1Dr/CAM-toSort1-USA
  WD30EZRZ/Sync1Dr/CAT-Buddhism
  WD30EZRZ/Sync1Dr/CAT-OutThere
  WD30EZRZ/Sync1Dr/CAT-OutThere-UK
  WD30EZRZ/Sync1Dr/CAT-Wellbeing
  WD30EZRZ/Sync1Dr/COutThere
  WD30EZRZ/Sync1Dr/Vs-WimHof-guides
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

