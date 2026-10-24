#!/bin/bash

# Joseph Harriott - http://harriott.github.io - Sat 29 Nov 2025

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------

# bash $onGH/FM-rsync-drives/rsync0-HDTB330EK3CA.sh
# occasionally move logs from  /mnt/SDU3D1TB  to  $ITcoAh/ml-$host/rpd

# createTarget=1  # usually commented out

#=> 0 abstracted list of included locations on sbMb
# $Drpbx  core directories are handled by  $ABnm/etc/rsnapshot.conf
# set first item to 0 to exclude a directory:
dirsAbstract=(
  0 sbmb_parent_directory directory_to_sync remote_parent_directory
  0 $Drpbx                Apps              /run/media/jo/HDTB330EK3CA/sync/Dr-more
  0 $Drpbx                conflicted        /run/media/jo/HDTB330EK3CA/sync/Dr-more
  0 $Drpbx                copied            /run/media/jo/HDTB330EK3CA/sync/Dr-more
  0 $Drpbx                dusty             /run/media/jo/HDTB330EK3CA/sync/Dr-more
  0 $Drpbx                JCD-imagey-e3     /run/media/jo/HDTB330EK3CA/sync/Dr-more
  0 $Drpbx                music             /run/media/jo/HDTB330EK3CA/sync/Dr-more
  0 $Drpbx                talks             /run/media/jo/HDTB330EK3CA/sync/Dr-more
  0 $Drpbx                Thb               /run/media/jo/HDTB330EK3CA/sync/Dr-more
  0 $Drpbx                toReduce          /run/media/jo/HDTB330EK3CA/sync/Dr-more
  0 /mnt/WD20EZAZ         Cop-IT            /run/media/jo/HDTB330EK3CA/sync
  0 /mnt/SDU3D1TB         stack             /run/media/jo/HDTB330EK3CA/sync
)
# /run/media/jo/HDTB330EK3CA/sync/readme.md
# /run/media/jo/HDTB330EK3CA/Vs-readme.md (Toshiba Canvio Basics 3TB portable 2.5" USB 3.0)
# /run/media/jo/WD30EZRZ/sync/readme.md

#=> 1 rsync
source $onGH/FM-rsync-drives/rsync1.sh

