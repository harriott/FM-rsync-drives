#!/bin/bash

# Joseph Harriott - Sat 01 Jul 2023

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------
#  bash $onGH/FM-rsync-drives/rsync0.sh

# rpd  is defined in my  $Bash/bashrc-ob

createTarget=1  # usually commented out

#=> 0 abstracted list of included locations
# set first item to 0 to exclude a directory:
dirsAbstract=(
  0 Cafezoide           $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 CforWork            $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 copied              $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  1 core                $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 F+F                 $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 JCD-imagey-e3       $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 now                 $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 Sh-AsusW202         $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 Sh-OppoA76          $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 Sh-sbMb             $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 Sh-XA10II           $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 stack               $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 T91-default-release $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 technos             $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 Theatre0            $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 Theatre1            $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 Then0               $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 Then1               $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 work                $DJH          /run/media/jo/WD30EZRZ/Sync0Dr/JH
  0 Apps                $Drpbx        /run/media/jo/WD30EZRZ/Sync1Dr
  0 CAM-best            $Drpbx        /run/media/jo/WD30EZRZ/Sync1Dr
  0 CAM-good            $Drpbx        /run/media/jo/WD30EZRZ/Sync1Dr
  0 CAM-joy             $Drpbx        /run/media/jo/WD30EZRZ/Sync1Dr
  0 CAM-toSort0         $Drpbx        /run/media/jo/WD30EZRZ/Sync1Dr
  0 CAM-toSort1         $Drpbx        /run/media/jo/WD30EZRZ/Sync1Dr
  0 CAM-toSort1-UK      $Drpbx        /run/media/jo/WD30EZRZ/Sync1Dr
  0 CAM-toSort1-USA     $Drpbx        /run/media/jo/WD30EZRZ/Sync1Dr
  0 CAT-Buddhism        $Drpbx        /run/media/jo/WD30EZRZ/Sync1Dr
  0 CAT-OutThere        $Drpbx        /run/media/jo/WD30EZRZ/Sync1Dr
  0 CAT-OutThere-UK     $Drpbx        /run/media/jo/WD30EZRZ/Sync1Dr
  0 CAT-Wellbeing       $Drpbx        /run/media/jo/WD30EZRZ/Sync1Dr
  0 COutThere           $Drpbx        /run/media/jo/WD30EZRZ/Sync1Dr
  0 Photos              $Drpbx        /run/media/jo/WD30EZRZ/Sync0Dr
  0 Vs-WimHof-guides    $Drpbx        /run/media/jo/WD30EZRZ/Sync1Dr
  1 IT-Copied           /mnt/SDU3D1TB /run/media/jo/WD30EZRZ
  0 Sync2               /mnt/SDU3D1TB /run/media/jo/WD30EZRZ
)  # $DJH  $Drpbx  defined in my  $OSAB/Bash/export-storage

#=> 1 make the include array
source $onGH/FM-rsync-drives/rsync1-makeIncludeArray.sh

#=> 2 list the included directories
echo -en "so this BASH script will run \e[1mrsync\e[0m, pushing all changes, "
echo "either to or from these local directories:"
source $onGH/FM-rsync-drives/rsync2-list_included.sh

#=> 3 decide what to do
if [ $1 ]; then
    drctn=$1
else
    read -p "Sync TO (T) portable drives (or dry-run (t)), or FROM (F) (or dry-run (f))? " drctn
fi
if [ $drctn ]; then
    dryRun=''
    if [ $drctn = "T" ]; then
        read -p "Run several: ${tpf7b}$rsynccom <localdrive> <portabledrive> ? ${tpfn}" cnfrm
    elif [ $drctn = "t" ]; then
        dryRun='n'  # rsync's dry-run switch
        echo "Okay, running: ${tpf7b}$rsynccom <localdrive> <portabledrivebackup>${tpfn}"
        cnfrm="y"
    elif [ $drctn = "F" ]; then
        echo "About to run several: ${tpf5b}$rsynccom <portabledrive> <localdrive>${tpfn}"
        read -p "No recovery possible from this operation, GO AHEAD? " cnfrm
    elif [ $drctn = "f" ]; then
        dryRun='n'  # rsync's dry-run switch
        echo -e "Okay, running: \e[1m$rsynccom <portabledrivebackup> <localdrive>\e[0m"
        cnfrm="y"
    else
        exit
    fi
    if [ ! $cnfrm ] || [ $cnfrm != "y" ]; then exit; fi
    rsynccom="rsync -ilrt$dryRun --delete"
else
    exit
fi

#=> 4 do it
script_basename=$(basename "${BASH_SOURCE[0]}")
source $onGH/FM-rsync-drives/rsync3-do_it.sh

