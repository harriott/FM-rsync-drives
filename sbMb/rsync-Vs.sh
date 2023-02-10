#!/bin/bash
# vim: sw=2:

# rsync backups of my preferred videos
# ------------------------------------
# alias  rsV  is defined in my  $Bash/bashrc-console
# or  bash $onGH/rsync-drives/sbMb/rsync-Vs.sh

# createTarget=1  # usually commented out

scriptDir=$( dirname "${BASH_SOURCE[0]}" )
  rsyncDir=${scriptDir%/*}  # up one, for accessing sourced scripts

#=> 0 includes 0 abstracted list of included locations
includeIndexed=(
  0 Vs-do
  0 Vs-educate
  0 Vs-forChildren
  0 Vs-forChildren-best
  0 Vs-forChildren-best-Europe
  0 Vs-forChildren-best-US
  0 Vs-forChildren-unseen
  0 Vs-inform-arts
  0 Vs-inform-belief
  0 Vs-inform-history
  0 Vs-inform-other
  0 Vs-inform-technos
  0 Vs-inform-war
  0 Vs-literature
  0 Vs-nature
  0 Vs-story
  0 Vs-story-favs
  1 Vs-story-favs-US
  1 Vs-story-fun
  1 Vs-story-unseen
  1 Vs-story-US
  1 Vs-story-war
  1 Vs-theatre
  1 Vs-wellbeing
) # defines the order

#=> 0 includes 1 make the include array
source $rsyncDir/rsync-makeIncludeArray.sh

#=> 0 source locations on sbMb
dirSource=(
  /mnt/SDU3D1TB/Vs-do
  /mnt/SDU3D1TB/Vs-educate
  /mnt/WD1001FALS/Vs-forChildren
  /mnt/WD1001FALS/Vs-forChildren-best
  /mnt/WD1001FALS/Vs-forChildren-best-Europe
  /mnt/WD1001FALS/Vs-forChildren-best-US
  /mnt/WD1001FALS/Vs-forChildren-unseen
  /mnt/ST4000VN008/Vs-inform-arts
  /mnt/ST4000VN008/Vs-inform-belief
  /mnt/ST4000VN008/Vs-inform-history
  /mnt/ST4000VN008/Vs-inform-other
  /mnt/ST4000VN008/Vs-inform-technos
  /mnt/ST4000VN008/Vs-inform-war
  /mnt/ST4000VN008/Vs-literature
  /mnt/ST4000VN008/Vs-nature
  /mnt/ST4000VN008/Vs-story
  /mnt/ST4000VN008/Vs-story-favs
  /mnt/ST4000VN008/Vs-story-favs-US
  /mnt/ST4000VN008/Vs-story-fun
  /mnt/ST4000VN008/Vs-story-unseen
  /mnt/ST4000VN008/Vs-story-US
  /mnt/ST4000VN008/Vs-story-war
  /mnt/ST4000VN008/Vs-theatre
  /mnt/ST4000VN008/Vs-wellbeing
)
#=> 0 target locations on portable drives
dirTarget=(
  run/media/jo/WD30EZRZ/Vs-do
  run/media/jo/WD30EZRZ/Vs-educate
  run/media/jo/TOSHIBA/Vs-forChildren
  run/media/jo/TOSHIBA/Vs-forChildren-best
  run/media/jo/TOSHIBA/Vs-forChildren-best-Europe
  run/media/jo/TOSHIBA/Vs-forChildren-best-US
  run/media/jo/TOSHIBA/Vs-forChildren-unseen
  run/media/jo/WD30EZRZ/Vs-inform-arts
  run/media/jo/TOSHIBA/Vs-inform-belief
  run/media/jo/TOSHIBA/Vs-inform-history
  run/media/jo/WD30EZRZ/Vs-inform-other
  run/media/jo/TOSHIBA/Vs-inform-technos
  run/media/jo/TOSHIBA/Vs-inform-war
  run/media/jo/TOSHIBA/Vs-literature
  run/media/jo/TOSHIBA/Vs-nature
  run/media/jo/TOSHIBA/Vs-story
  run/media/jo/TOSHIBA/Vs-story-favs
  run/media/jo/TOSHIBA/Vs-story-favs-US
  run/media/jo/TOSHIBA/Vs-story-fun
  run/media/jo/TOSHIBA/Vs-story-unseen
  run/media/jo/TOSHIBA/Vs-story-US
  run/media/jo/TOSHIBA/Vs-story-war
  run/media/jo/TOSHIBA/Vs-theatre
  run/media/jo/WD30EZRZ/Vs-wellbeing
)

#=> 1 list the included directories
echo -e "This BASH script will \e[1mrsync\e[0m from all of these local directories:\e[92m"
source "$rsyncDir/rsync-list_included.sh"

# #=> 2 rsync checks from sources
# outf=`basename ${BASH_SOURCE[0]}`
# drctn="f"  # required by  rsync-do_it.sh
# rsynccom="rsync -ilnrt --delete --progress"
# source $rsyncDir/rsync-do_it.sh

#=> 3 do the rsyncs to targets
outf=`basename ${BASH_SOURCE[0]}`
drctn="t"  # required by  rsync-do_it.sh
rsynccom="rsync -ilrt --delete --progress"
source $rsyncDir/rsync-do_it.sh

