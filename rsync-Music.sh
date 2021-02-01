#!/bin/bash

# rsync backups of my preferred videos
# alias  rsM  is defined in my  $Bash/bashrc-console

ac="rsync -irtv --delete --progress /mnt/WD1001FALS"

for bd in ST905004EXD101 TOSHIBA; do
    bl=/run/media/jo/$bd

    for caps in D+E F+G H-K L+M N-Q R+S T-Z; do
        SM=SharonMusic-$caps
        echo "${tpf2}Now rsyncing to $bl/$SM:${tpfn}"
        $ac/$SM/ $bl/$SM
    done

done
