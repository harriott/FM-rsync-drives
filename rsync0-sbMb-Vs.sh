#!/bin/bash
# vim: fdl=1 sw=2:

# rsync backups of my preferred videos
# ------------------------------------
# bash $onGH/FM-rsync-drives/rsync0-sbMb-Vs.sh T

# occasionally delete logs from  /mnt/SDU3D1TB

# createTarget=1  # usually commented out

#=> 0 abstracted list of included locations
dirsAbstract=(
  1 /mnt/SDU3D1TB    Vs-do                         /run/media/jo/WD30EZRZ
  1 /mnt/ST4000VN008 Vs-story                      /run/media/jo/TOSHIBA
  1 /mnt/ST4000VN008 Vs-story-favs                 /run/media/jo/TOSHIBA
  1 /mnt/ST4000VN008 Vs-story-favs-US              /run/media/jo/TOSHIBA
  1 /mnt/ST4000VN008 Vs-story-favs-US-bad-guys     /run/media/jo/TOSHIBA
  1 /mnt/ST4000VN008 Vs-story-fun                  /run/media/jo/TOSHIBA
  1 /mnt/ST4000VN008 Vs-story-US                   /run/media/jo/TOSHIBA
  0 /mnt/ST4000VN008 Vs-story-unseen               /run/media/jo/TOSHIBA
  1 /mnt/ST4000VN008 Vs-story-war                  /run/media/jo/TOSHIBA
  1 /mnt/WD1001FALS  Vs-inform-arts                /run/media/jo/WD30EZRZ
  1 /mnt/WD1001FALS  Vs-inform-educate             /run/media/jo/WD30EZRZ
  1 /mnt/WD1001FALS  Vs-inform-human_body          /run/media/jo/WD30EZRZ
  1 /mnt/WD1001FALS  Vs-inform-mystic              /run/media/jo/WD30EZRZ
  1 /mnt/WD1001FALS  Vs-inform-technos             /run/media/jo/WD30EZRZ
  1 /mnt/WD1001FALS  Vs-inform-war                 /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ    Vs-forChildren                /run/media/jo/TOSHIBA
  1 /mnt/WD20EZAZ    Vs-forChildren-best           /run/media/jo/TOSHIBA
  1 /mnt/WD20EZAZ    Vs-forChildren-best-Europe    /run/media/jo/TOSHIBA
  1 /mnt/WD20EZAZ    Vs-forChildren-best-US        /run/media/jo/TOSHIBA
  1 /mnt/WD20EZAZ    Vs-forChildren-unseen         /run/media/jo/TOSHIBA
  1 /mnt/WD20EZAZ    Vs-inform-other-world-Eurasia /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ    Vs-inform-history             /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ    Vs-inform-other               /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ    Vs-literature                 /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ    Vs-nature                     /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ    Vs-theatre                    /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ    Vs-wellbeing                  /run/media/jo/WD30EZRZ
) # defines the order

#=> 1 rsync
source $onGH/FM-rsync-drives/rsync1.sh

