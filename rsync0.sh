#!/bin/bash

# Joseph Harriott - Sat 01 Jul 2023

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------
#  bash $onGH/FM-rsync-drives/rsync0.sh

# rpd  is defined in my  $Bash/bashrc-ob

# createTarget=1  # usually commented out

#=> 0 directory locations
# $Drpbx  is defined in my  $OSAB/Bash/export-storage
extmnt=/run/media/jo

#==> includes 0 abstracted list of included locations
# set first item to 0 to exclude a directory:
includeIndexed=(
  0 JH-Cafezoide              $DJH
  0 JH-CforWork               $DJH
  0 JH-copied                 $DJH
  0 JH-core                   $DJH
  0 JH-F+F                    $DJH
  0 JH-JCD-imagey-e3          $DJH
  0 JH-now                    $DJH
  0 JH-Sh-AsusW202            $DJH
  0 JH-Sh-OppoA76             $DJH
  0 JH-Sh-sbMb                $DJH
  0 JH-Sh-XA10II              $DJH
  0 JH-stack                  $DJH
  0 JH-T91-default-release    $DJH
  0 JH-technos                $DJH
  0 JH-Theatre0               $DJH
  0 JH-Theatre1               $DJH
  0 JH-Then0                  $DJH
  0 JH-Then1                  $DJH
  0 JH-work                   $DJH
  0 Apps                      $Drpbx
  0 CAM-best                  $Drpbx
  0 CAM-good                  $Drpbx
  0 CAM-joy                   $Drpbx
  0 CAM-toSort0               $Drpbx
  0 CAM-toSort1               $Drpbx
  0 CAM-toSort1-UK            $Drpbx
  0 CAM-toSort1-USA           $Drpbx
  0 CAT-Buddhism              $Drpbx
  0 CAT-OutThere              $Drpbx
  0 CAT-OutThere-UK           $Drpbx
  0 CAT-Wellbeing             $Drpbx
  0 COutThere                 $Drpbx
  0 Photos                    $Drpbx
  0 Vs-WimHof-guides          $Drpbx
  0 IT-Copied                 /mnt/SDU3D1TB
  1 Sync2                     /mnt/SDU3D1TB
)  # this list defines the sort order

#==> includes 1 make the include array
source $onGH/FM-rsync-drives/rsync1-makeIncludeArray.sh

#==> source locations on machines
# $host  is defined in  $OSAB/Bash/export-storage

#===> AsusW202
if [ $host = "AsusW202" ]; then exit; fi  # $host  is defined in  $OSAB/Bash/export-storage

#===> i34G1TU02
if [ $host = "i34G1TU02" ]; then exit; fi  # $host  is defined in  $OSAB/Bash/export-storage

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
        $Drpbx/Photos
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
  WD30EZRZ/Sync0Dr/Photos
  WD30EZRZ/Sync1Dr/Vs-WimHof-guides
  WD30EZRZ/IT-Copied
  WD30EZRZ/Sync2
)

#=> 1 list the included directories
echo -en "This BASH script will run \e[1mrsync\e[0m, pushing all changes, "
echo -e "either to or from these local directories:\e[92m"
source $onGH/FM-rsync-drives/rsync2-list_included.sh

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
source $onGH/FM-rsync-drives/rsync3-do_it.sh

