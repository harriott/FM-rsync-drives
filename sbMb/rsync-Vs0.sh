#!/bin/bash
# vim: sw=2:

# rsync backups of my preferred videos
# alias  rsVP  is defined in my  $Bash/bashrc-console
# bash $onGH/rsync-portabledrives/sbMb/rsync-Vs0.sh

set -e  # terminate on a fail

scriptDir=$( dirname "${BASH_SOURCE[0]}" )
  rsyncDir=${scriptDir%/*}  # for accessing sourced scripts

#=> 0 includes 0 abstracted list of locations
includeIndexed=(
  1 Vs-do \
  1 Vs-educate \
  1 Vs-forChildren \
  1 Vs-forChildren-best \
  1 Vs-forChildren-best-Europe \
  1 Vs-forChildren-best-US \
  1 Vs-forChildren-unseen \
  1 Vs-inform-arts \
  1 Vs-inform-belief \
  1 Vs-inform-history \
  1 Vs-inform-other \
  1 Vs-inform-technos \
  1 Vs-inform-war \
  1 Vs-literature \
  1 Vs-nature \
  1 Vs-story \
  1 Vs-story-favs \
  1 Vs-story-favs-US \
  1 Vs-story-fun \
  1 Vs-story-unseen \
  1 Vs-story-US \
  1 Vs-story-war \
  1 Vs-theatre \
)
#=> 0 includes 1 make the include array
source $rsyncDir/include1.sh

#=> 0 source locations on sbMb
dirSource=(
  "/mnt/ST4000VN008/Vs-do/" \
  "/mnt/ST4000VN008/Vs-educate/" \
  "/mnt/ST4000VN008/Vs-forChildren/" \
  "/mnt/ST4000VN008/Vs-forChildren-best/" \
  "/mnt/ST4000VN008/Vs-forChildren-best-Europe/" \
  "/mnt/ST4000VN008/Vs-forChildren-best-US/" \
  "/mnt/ST4000VN008/Vs-forChildren-unseen/" \
  "/mnt/ST4000VN008/Vs-inform-arts/" \
  "/mnt/ST4000VN008/Vs-inform-belief/" \
  "/mnt/ST4000VN008/Vs-inform-history/" \
  "/mnt/ST4000VN008/Vs-inform-other/" \
  "/mnt/ST4000VN008/Vs-inform-technos/" \
  "/mnt/ST4000VN008/Vs-inform-war/" \
  "/mnt/ST4000VN008/Vs-literature/" \
  "/mnt/ST4000VN008/Vs-nature/" \
  "/mnt/ST4000VN008/Vs-story/" \
  "/mnt/ST4000VN008/Vs-story-favs/" \
  "/mnt/ST4000VN008/Vs-story-favs-US/" \
  "/mnt/ST4000VN008/Vs-story-fun/" \
  "/mnt/ST4000VN008/Vs-story-unseen/" \
  "/mnt/ST4000VN008/Vs-story-US/" \
  "/mnt/ST4000VN008/Vs-story-war/" \
  "/mnt/ST4000VN008/Vs-theatre/" \
)
#=> 0 target locations on sbMb
dirTarget=(
  /mnt/HD103SJ/Vs-do/ \
  /mnt/WD30EZRZ/Vs-educate/ \
  /mnt/HD103SJ/Vs-forChildren/ \
  /mnt/WD30EZRZ/Vs-forChildren-best/ \
  /mnt/WD30EZRZ/Vs-forChildren-best-Europe/ \
  /mnt/WD30EZRZ/Vs-forChildren-best-US/ \
  /mnt/HD103SJ/Vs-forChildren-unseen/ \
  /mnt/HD103SJ/Vs-inform-arts/ \
  /mnt/HD103SJ/Vs-inform-belief/ \
  /mnt/HD103SJ/Vs-inform-history/ \
  /mnt/WD30EZRZ/Vs-inform-other/ \
  /mnt/WD30EZRZ/Vs-inform-technos/ \
  /mnt/HD103SJ/Vs-inform-war/ \
  /mnt/HD103SJ/Vs-literature/ \
  /mnt/WD30EZRZ/Vs-nature/ \
  /mnt/WD30EZRZ/Vs-story/ \
  /mnt/WD30EZRZ/Vs-story-favs/ \
  /mnt/WD30EZRZ/Vs-story-favs-US/ \
  /mnt/WD30EZRZ/Vs-story-fun/ \
  /mnt/HD103SJ/Vs-story-unseen/ \
  /mnt/WD30EZRZ/Vs-story-US/ \
  /mnt/HD103SJ/Vs-story-war/ \
  /mnt/HD103SJ/Vs-theatre/ \
)

#=> 1 list the included directories
echo -e "This BASH script will \e[1mrsync\e[0m from all of these local directories:\e[92m"
source "$rsyncDir/rsync-list_included.sh"

#=> 2 do the rsyncs
outf=`basename ${BASH_SOURCE[0]}`
drctn="t"
# source $rsyncDir/rsync-do_it.sh
