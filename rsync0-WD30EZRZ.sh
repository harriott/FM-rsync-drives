#!/bin/bash

# Joseph Harriott - http://harriott.github.io - Mon 19 May 2025

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------

# bash $onGH/FM-rsync-drives/rsync0-WD30EZRZ.sh
# occasionally move logs from  /mnt/SDU3D1TB  to  $hmlA/ml-$host/rpd

# createTarget=1  # usually commented out

#=> 0 abstracted list of included locations on sbMb
# set first item to 0 to exclude a directory:
dirsAbstract=(
  1 $DJH           Cop                         /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           Cop-code                    /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           Cop-work                    /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           core                        /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           dev-An                      /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           dev-Sh                      /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           hmlArch                     /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           JCD-imagey-e3               /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           Jo-F+F                      /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           Jo-now                      /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           Jo-technos                  /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           Jo-then0                    /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           Jo-then1                    /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           search                      /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           stack                       /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           Thb-dr                      /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           toReduce                    /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           work                        /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           work-Cz                     /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           work-Cz-imagesFlat          /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           work-theatre0               /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $DJH           work-theatre1               /run/media/jo/WD30EZRZ/sync/Drpbx0/JH
  1 $Drpbx         Apps                        /run/media/jo/WD30EZRZ/sync/Drpbx0
  1 $Drpbx         conflicted                  /run/media/jo/WD30EZRZ/sync/Drpbx0
  1 $Drpbx         Photos                      /run/media/jo/WD30EZRZ/sync/Drpbx0
  1 $Drpbx/Cop     AM-best                     /run/media/jo/WD30EZRZ/sync/Drpbx1
  1 $Drpbx/Cop     AM-good                     /run/media/jo/WD30EZRZ/sync/Drpbx1
  1 $Drpbx/Cop     AM-good-US                  /run/media/jo/WD30EZRZ/sync/Drpbx1
  1 $Drpbx/Cop     AM-joy-copies               /run/media/jo/WD30EZRZ/sync/Drpbx1
  1 $Drpbx/Cop     AM-toSort0                  /run/media/jo/WD30EZRZ/sync/Drpbx1
  1 $Drpbx/Cop     AM-toSort1-USA              /run/media/jo/WD30EZRZ/sync/Drpbx1
  1 $Drpbx/Cop     AT-BuDh                     /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     AT-BuDh-T-oldBirkenSite     /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     AT-BuDh-T-ThanissaroBhikkhu /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     AT-BuDh-Theravada           /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     AT-OutThere                 /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     AT-OutThere-UK              /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     AT-Wb                       /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     AT-Wb-m-Samaneri_Jayasara   /run/media/jo/WD30EZRZ/sync/Drpbx2
  1 $Drpbx/Cop     OutThere                    /run/media/jo/WD30EZRZ/sync/Drpbx0
  1 $Drpbx/Cop     Vs-WimHof-guides            /run/media/jo/WD30EZRZ/sync/Drpbx0
  1 /mnt/WD20EZAZ  Cop-IT                      /run/media/jo/WD30EZRZ/sync
  1 /mnt/SDU3D1TB  stack                       /run/media/jo/WD30EZRZ/sync
)  # $DJH  $Drpbx  defined in my  $OSAB/nodes-Bash/export-storage

#=> 1 rsync
source $onGH/FM-rsync-drives/rsync1.sh

