#!/bin/bash

# rsync backups of my as yet unsorted music collection
# alias  rsM  is defined in my  $Bash/bashrc-console

ac="rsync -irtv --delete --progress /mnt/SD480GSSDPlus"

for bl in /run/media/jo/ST905004EXD101 /run/media/jo/ST3320418AS; do

    for ml in H-K L+M N-Q R+S T-Z; do
        fullcmd="$ac/SharonMusic-$ml/ $bl/SharonMusic-$ml"
        echo $fullcmd
        $fullcmd
        # echo $fullcmd
        # read
    done

done

figlet -f univers finished

