#!/bin/bash
# vim: sw=2:

# rsync backups of my preferred videos
# alias rsVP is defined in my  $Bash/bashrc-console

ac="rsync -irtv --delete --progress /mnt/WD30EZRZ"

rsyncs () {
  for Vlocation in ${Vlocations[@]}; do
    cmd="$ac/$Vlocation $backupdisk/$Vlocation"
    echo ''
    echo ${tpf7b}$cmd${tpfn}
    $cmd
  done
}

backupdisk='/mnt/HD103SJ'
Vlocations=(
  Vs-do/ \
  Vs-Movies-Favs/ \
  Vs-Movies-Fun/ \
  Vs-Nature/ \
)
rsyncs

backupdisk='/run/media/jo/ST905004EXD101'
Vlocations=(
  Vs-do/ \
)
rsyncs

backupdisk='/run/media/jo/KDTG311281'
Vlocations=(
  Vs-do/ \
)
rsyncs

