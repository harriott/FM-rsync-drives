#!/bin/bash
# vim: sw=2:

# rsync backups of my preferred videos
# ------------------------------------
# alias  rsV  is defined in my  $Bash/bashrc-console
# or  bash $onGH/FM-rsync-drives/sbMb/Vs.sh

# createTarget=1  # usually commented out

#=> 0 abstracted list of included locations
dirsAbstract=(
  1 Vs-do                      /mnt/SDU3D1TB         /run/media/jo/WD30EZRZ
  1 Vs-educate                 /mnt/SDU3D1TB         /run/media/jo/WD30EZRZ
  1 Vs-humanBody               /mnt/SDU3D1TB         /run/media/jo/WD30EZRZ
  1 Vs-forChildren             /run/media/jo/HD103SJ /run/media/jo/TOSHIBA
  1 Vs-forChildren-best        /mnt/WD1001FALS       /run/media/jo/TOSHIBA
  1 Vs-forChildren-best-Europe /mnt/WD1001FALS       /run/media/jo/TOSHIBA
  1 Vs-forChildren-best-US     /mnt/WD1001FALS       /run/media/jo/TOSHIBA
  1 Vs-forChildren-unseen      /run/media/jo/HD103SJ /run/media/jo/TOSHIBA
  1 Vs-inform-arts             /mnt/ST4000VN008      /run/media/jo/WD30EZRZ
  1 Vs-inform-belief           /mnt/ST4000VN008      /run/media/jo/TOSHIBA
  1 Vs-inform-history          /mnt/ST4000VN008      /run/media/jo/TOSHIBA
  1 Vs-inform-other            /mnt/ST4000VN008      /run/media/jo/WD30EZRZ
  1 Vs-inform-technos          /mnt/ST4000VN008      /run/media/jo/TOSHIBA
  1 Vs-inform-war              /mnt/ST4000VN008      /run/media/jo/TOSHIBA
  1 Vs-literature              /mnt/ST4000VN008      /run/media/jo/TOSHIBA
  1 Vs-nature                  /mnt/ST4000VN008      /run/media/jo/TOSHIBA
  1 Vs-story                   /mnt/ST4000VN008      /run/media/jo/TOSHIBA
  1 Vs-story-favs              /mnt/ST4000VN008      /run/media/jo/TOSHIBA
  1 Vs-story-favs-US           /mnt/ST4000VN008      /run/media/jo/TOSHIBA
  1 Vs-story-favs-US-bad-guys  /mnt/WD1001FALS       /run/media/jo/TOSHIBA
  1 Vs-story-fun               /mnt/ST4000VN008      /run/media/jo/TOSHIBA
  1 Vs-story-unseen            /mnt/ST4000VN008      /run/media/jo/TOSHIBA
  1 Vs-story-US                /mnt/ST4000VN008      /run/media/jo/TOSHIBA
  1 Vs-story-war               /mnt/ST4000VN008      /run/media/jo/TOSHIBA
  1 Vs-theatre                 /mnt/WD1001FALS       /run/media/jo/WD30EZRZ
  1 Vs-wellbeing               /mnt/ST4000VN008      /run/media/jo/WD30EZRZ
) # defines the order

#=> 1 make the include array
source $onGH/FM-rsync-drives/rsync1-makeIncludeArray.sh

#=> 2 list the included directories
echo -e "So this BASH script will \e[1mrsync\e[0m from all of these local directories:"
source $onGH/FM-rsync-drives/rsync2-list_included.sh

#=> 3 do the rsyncs to targets
script_basename=$(basename "${BASH_SOURCE[0]}")
drctn="t"  # required by  $onGH/FM-rsync-drives/rsync3-do_it.sh
rsynccom="rsync -ilrt --delete --progress"
source $onGH/FM-rsync-drives/rsync3-do_it.sh

