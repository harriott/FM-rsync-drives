#!/bin/bash
# vim: sw=2:

# rsync backups of my preferred videos
# alias  rsVP  is defined in my  $Bash/bashrc-console

set -e  # terminate on a fail

active="rsync -irtv --delete --progress /mnt/ST4000VN008"

rsyncs () {
  for Vlocation in ${Vlocations[@]}; do
    # cmd="$active/$Vlocation $backupdisk/$Vlocation"
    cmd="$rs $active $backupdisk/$Vlocation"
    echo ''
    echo ${tpf7b}$cmd${tpfn}
    $cmd
  done
}

backupdisk='/mnt/HD103SJ'
Vlocations=(
  Vs-forChildren/ \
  Vs-inform-arts/ \
  Vs-inform-belief/ \
  Vs-inform-history/ \
  Vs-inform-war/ \
  Vs-literature/ \
  Vs-story-unseen/ \
  Vs-story-war/ \
  Vs-theatre/ \
)
rsyncs

backupdisk='/mnt/WD30EZRZ'
Vlocations=(
  Vs-educate/ \
  Vs-forChildren-best/ \
  Vs-forChildren-best-Europe/ \
  Vs-forChildren-best-US/ \
  Vs-inform-other/ \
  Vs-inform-technos/ \
  Vs-nature/ \
  Vs-story/ \
  Vs-story-favs/ \
  Vs-story-favs-US/ \
  Vs-story-fun/ \
  Vs-story-US/ \
)
rsyncs

backupdisk='/run/media/jo/9QF57J6Q'
Vlocations=(
  Vs-forChildren-unseen/ \
)
rsyncs

backupdisk='/run/media/jo/ST905004EXD101'
Vlocations=(
  Vs-do/ \
  Vs-educate/ \
)
rsyncs

backupdisk='/run/media/jo/KDT100G3B'
Vlocations=(
  Vs-educate/ \
)
rsyncs

figlet -f univers 'done'

