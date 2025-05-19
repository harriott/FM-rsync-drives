#!/bin/bash
# vim: sw=2:

# rsync backups of my preferred videos
# ------------------------------------
# bash $onGH/FM-rsync-drives/sbMb/Vs.sh

# occasionally delete logs from  /mnt/SDU3D1TB

# createTarget=1  # usually commented out

#=> 0 abstracted list of included locations
dirsAbstract=(
  1 /mnt/SDU3D1TB    Vs-do                      /run/media/jo/WD30EZRZ
  1 /mnt/ST4000VN008 Vs-inform-history          /run/media/jo/WD30EZRZ
  1 /mnt/ST4000VN008 Vs-inform-other            /run/media/jo/WD30EZRZ
  1 /mnt/ST4000VN008 Vs-story                   /run/media/jo/TOSHIBA
  1 /mnt/ST4000VN008 Vs-story-US                /run/media/jo/TOSHIBA
  1 /mnt/ST4000VN008 Vs-story-favs              /run/media/jo/TOSHIBA
  1 /mnt/ST4000VN008 Vs-story-favs-US           /run/media/jo/TOSHIBA
  1 /mnt/ST4000VN008 Vs-story-favs-US-bad-guys  /run/media/jo/TOSHIBA
  1 /mnt/ST4000VN008 Vs-story-fun               /run/media/jo/TOSHIBA
  1 /mnt/ST4000VN008 Vs-story-unseen            /run/media/jo/TOSHIBA
  1 /mnt/ST4000VN008 Vs-story-war               /run/media/jo/TOSHIBA
  1 /mnt/WD1001FALS  Vs-inform-arts             /run/media/jo/WD30EZRZ
  1 /mnt/WD1001FALS  Vs-inform-educate          /run/media/jo/WD30EZRZ
  1 /mnt/WD1001FALS  Vs-inform-human_body       /run/media/jo/WD30EZRZ
  1 /mnt/WD1001FALS  Vs-inform-mystic           /run/media/jo/WD30EZRZ
  1 /mnt/WD1001FALS  Vs-inform-technos          /run/media/jo/WD30EZRZ
  1 /mnt/WD1001FALS  Vs-inform-war              /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ    Vs-forChildren             /run/media/jo/TOSHIBA
  1 /mnt/WD20EZAZ    Vs-forChildren-best        /run/media/jo/TOSHIBA
  1 /mnt/WD20EZAZ    Vs-forChildren-best-Europe /run/media/jo/TOSHIBA
  1 /mnt/WD20EZAZ    Vs-forChildren-best-US     /run/media/jo/TOSHIBA
  1 /mnt/WD20EZAZ    Vs-forChildren-unseen      /run/media/jo/TOSHIBA
  1 /mnt/WD20EZAZ    Vs-literature              /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ    Vs-nature                  /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ    Vs-theatre                 /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ    Vs-wellbeing               /run/media/jo/WD30EZRZ
) # defines the order

#=> 1 make the include array
source $onGH/FM-rsync-drives/rsync2-makeIncludeArray.sh

#=> 2 list the included directories
echo -e "So this BASH script will \e[1mrsync\e[0m from all of these local directories:"
source $onGH/FM-rsync-drives/rsync3-list_included.sh

#=> 3 do the rsyncs to targets
script_basename=$(basename "${BASH_SOURCE[0]}")
echo $script_basename
drctn="t"  # required by  $onGH/FM-rsync-drives/rsync4-do_it.sh
rsynccom="rsync -ilrt --delete --progress"
source $onGH/FM-rsync-drives/rsync4-do_it.sh

