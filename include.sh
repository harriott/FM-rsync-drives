#!/bin/bash
# vim: set et tw=0:

# Called from  rsync.sh

# set first item to 0 to exclude a directory:
includeIndexed=( 1 Dropbox/CA-Buddhism \
                 1 Dropbox/CA-OutThere-UK \
                 1 Dropbox/CA-Theravada \
                 1 Dropbox/CAMusic-Europe \
                 1 Dropbox/CAMusic-fromSharon \
                 1 Dropbox/CAMusic-Germanic \
                 1 Dropbox/CAMusic-USA \
                 1 Dropbox/CAMusic-West \
                 1 Dropbox/CAMusic-World \
                 1 Dropbox/CAudio-OutThere \
                 1 Dropbox/Copied-OutThere \
                 1 Dropbox/JH/Copied \
                 1 Dropbox/JH/F+F \
                 1 Dropbox/JH/IT_stack \
                 1 Dropbox/JH/Now \
                 1 Dropbox/JH/Stack \
                 1 Dropbox/JH/Theatre0 \
                 1 Dropbox/JH/Theatre1 \
                 1 Dropbox/JH/Then0 \
                 1 Dropbox/JH/Then1 \
                 1 Dropbox/JH/toReduce \
                 1 Dropbox/JH/Work \
                 1 Dropbox/Photos \
                 1 IT-Copied \
                 1 IT-DebianBased-Copied \
                 1 More)
# get the include array:
include=(${includeIndexed[0]})
i=0
while [ $i -le ${#includeIndexed[@]} ]; do
    ((i+=2))
    include=(${include[@]} ${includeIndexed[i]})
done
echo "(include switches: ${include[@]})"

