#!/bin/bash

# Joseph Harriott - http://harriott.github.io - Tue 07 Jan 2025

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------
#  bash $onGH/FM-rsync-drives/rsync0.sh

# rpd  is defined in my  $AjB/bashrc-ob
# bash $onGH/FM-rsync-drives/rsync0.sh $1
# occasionally move logs from  /mnt/SDU3D1TB  to  $ulLAh/ml-$host/rpd

createTarget=1  # usually commented out

#=> 0 abstracted list of included locations - sbMb
# set first item to 0 to exclude a directory:
dirsAbstract=(
  1 $DJH           Cop                         /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           Cop-work                    /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           core                        /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           dev-An                      /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           dev-Sh                      /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           JCD-imagey-e3               /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           Jo-F+F                      /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           Jo-now                      /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           Jo-technos                  /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           Jo-then0                    /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           Jo-then1                    /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           stack                       /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           Thb-dr                      /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           work                        /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           work-Cz                     /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           work-Cz-imagesFlat          /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           work-theatre0               /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           work-theatre1               /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $Drpbx         Apps                        /run/media/jo/WD30EZRZ/sync/Drpbx0
  1 $Drpbx         Photos                      /run/media/jo/WD30EZRZ/sync/Drpbx0
  1 $Drpbx/Cop     AM-best                     /run/media/jo/WD30EZRZ/sync/Drpbx1
  1 $Drpbx/Cop     AM-good                     /run/media/jo/WD30EZRZ/sync/Drpbx1
  1 $Drpbx/Cop     AM-good-tA-North-US         /run/media/jo/WD30EZRZ/sync/Drpbx1
  1 $Drpbx/Cop     AM-joy                      /run/media/jo/WD30EZRZ/sync/Drpbx1
  1 $Drpbx/Cop     AM-toSort0                  /run/media/jo/WD30EZRZ/sync/Drpbx1
  1 $Drpbx/Cop     AM-toSort1                  /run/media/jo/WD30EZRZ/sync/Drpbx1
  1 $Drpbx/Cop     AM-toSort1-UK               /run/media/jo/WD30EZRZ/sync/Drpbx1
  1 $Drpbx/Cop     AM-toSort1-USA              /run/media/jo/WD30EZRZ/sync/Drpbx1
  1 $Drpbx/Cop     AT-BuDh                     /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     AT-BuDh-Theravada           /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     AT-BuDh-T-oldBirkenSite     /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     AT-BuDh-T-ThanissaroBhikkhu /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     AT-OutThere                 /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     AT-OutThere-UK              /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     AT-Wb                       /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     AT-Wb-m-Samaneri_Jayasara   /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     GRs                         /run/media/jo/WD30EZRZ/sync/Drpbx0
  1 $Drpbx/Cop     GRs-nerd-fonts              /run/media/jo/WD30EZRZ/sync/Drpbx0
  1 $Drpbx/Cop     OutThere                    /run/media/jo/WD30EZRZ/sync/Drpbx0
  1 $Drpbx/Cop     Vs-WimHof-guides            /run/media/jo/WD30EZRZ/sync/Drpbx0
  1 /mnt/WD20EZAZ  Cop-IT                      /run/media/jo/WD30EZRZ/sync
  1 /mnt/SDU3D1TB  stack                       /run/media/jo/WD30EZRZ/sync
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

