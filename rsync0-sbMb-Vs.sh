#!/bin/bash
# vim: fdl=1 sw=2:

# rsync backups of my preferred videos
# ------------------------------------
# bash $onGH/FM-rsync-drives/rsync0-sbMb-Vs.sh T

#  and  fv() in  $AjB/bashrc-wm

# occasionally delete logs from  /mnt/SDU3D1TB

# createTarget=1  # usually commented out

#=> 0 abstracted list of included locations
dirsAbstract=(
  0 sbmb_parent_directory         directory_to_sync                        remote_parent_directory
  0 /mnt/SDU3D1TB                 Vs-do                                    /run/media/jo/WD30EZRZ
  0 /mnt/ST4000VN008              Vs-inform-arts                           /run/media/jo/WD30EZRZ
  0 /mnt/ST4000VN008              Vs-inform-educate                        /run/media/jo/WD30EZRZ
  0 /mnt/ST4000VN008              Vs-inform-history                        /run/media/jo/WD30EZRZ
  0 /mnt/ST4000VN008              Vs-inform-human_body                     /run/media/jo/WD30EZRZ
  0 /mnt/ST4000VN008              Vs-inform-mystic                         /run/media/jo/WD30EZRZ
  0 /mnt/ST4000VN008              Vs-inform-other                          /run/media/jo/WD30EZRZ
  0 /mnt/ST4000VN008              Vs-inform-other-world-Eurafrasia-Eurasia /run/media/jo/WD30EZRZ
  0 /mnt/ST4000VN008              Vs-inform-technos                        /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ                 Vs-forChildren                           /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ                 Vs-forChildren-best                      /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ                 Vs-forChildren-best-Europe               /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ                 Vs-forChildren-best-US                   /run/media/jo/WD30EZRZ
  1 /mnt/WD20EZAZ                 Vs-forChildren-unseen                    /run/media/jo/WD30EZRZ
  0 /mnt/ST4000VN008              Vs-story                                 /run/media/jo/HDTB330EK3CA
  0 /mnt/ST4000VN008              Vs-story-favs                            /run/media/jo/HDTB330EK3CA
  0 /mnt/ST4000VN008              Vs-story-favs-US                         /run/media/jo/HDTB330EK3CA
  0 /mnt/ST4000VN008              Vs-story-favs-US-bad-guys                /run/media/jo/HDTB330EK3CA
  0 /mnt/ST4000VN008              Vs-story-fun                             /run/media/jo/HDTB330EK3CA
  0 /mnt/ST4000VN008              Vs-story-unseen                          /run/media/jo/HDTB330EK3CA
  0 /mnt/ST4000VN008              Vs-story-US                              /run/media/jo/HDTB330EK3CA
  0 /mnt/ST4000VN008              Vs-story-war                             /run/media/jo/HDTB330EK3CA
  0 /mnt/WD20EZAZ                 Vs-literature                            /run/media/jo/WD30EZRZ
  0 /mnt/WD20EZAZ                 Vs-nature                                /run/media/jo/WD30EZRZ
  0 /mnt/WD20EZAZ                 Vs-theatre                               /run/media/jo/WD30EZRZ
  0 /mnt/WD20EZAZ                 Vs-wellbeing                             /run/media/jo/WD30EZRZ
) # defines the order
# /run/media/jo/HDTB330EK3CA/Vs-readme.md (Toshiba Canvio Basics 3TB portable 2.5" USB 3.0)
# /run/media/jo/WD30EZRZ/Vs-readme.md
# mkdir Vs-do Vs-inform-arts Vs-inform-educate Vs-inform-history Vs-inform-human_body Vs-inform-mystic Vs-inform-other Vs-inform-other-world-Eurafrasia-Eurasia Vs-inform-technos Vs-literature Vs-nature Vs-theatre Vs-wellbeing
# mkdir Vs-forChildren Vs-forChildren-best Vs-forChildren-best-Europe Vs-forChildren-best-US Vs-forChildren-unseen
# mkdir Vs-story Vs-story-favs Vs-story-favs-US Vs-story-favs-US-bad-guys Vs-story-fun Vs-story-unseen Vs-story-US Vs-story-war

#=> 1 rsync
source $onGH/FM-rsync-drives/rsync1.sh

