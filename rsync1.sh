#!/bin/bash

# Joseph Harriott - http://harriott.github.io - Tue 07 Jan 2025

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------

# bash $onGH/FM-rsync-drives/rsync0.sh
# occasionally move logs from  /mnt/SDU3D1TB  to  $hmlA/ml-$host/FMrd

#=> 1 make the include array
source $onGH/FM-rsync-drives/rsync2-makeIncludeArray.sh

#=> 2 list the included directories
source $onGH/FM-rsync-drives/rsync3-list_included.sh

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
    fi  # check what to do
    if [ ! $cnfrm ] || [ $cnfrm != "y" ]; then exit; fi  # no confirmation was given
    rsynccom="rsync -ilrt$dryRun --delete"
else
    exit
fi

#=> 4 do it
script_basename=$(basename "${BASH_SOURCE[0]}")
echo $script_basename
source $onGH/FM-rsync-drives/rsync4-do_it.sh

