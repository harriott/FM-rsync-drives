#!/bin/bash
# vim: set et tw=0:

# Called from  rsync.sh

# set to 0 to exclude a directory:
includeIndexed=( 0 Dropbox/CAMusic-Europe \
                 0 Dropbox/CAMusic-Germanic \
                 0 Dropbox/CAMusic-USA \
                 0 Dropbox/CAMusic-West \
                 0 Dropbox/CAMusic-World \
                 0 Dropbox/CA-OutThere-UK \
                 0 Dropbox/CAudio-Music \
                 0 Dropbox/CAudio-OutThere \
                 0 Dropbox/Copied-OutThere \
                 0 Dropbox/JH/d-F+F \
                 0 Dropbox/JH/d-Stack \
                 0 Dropbox/JH/d-Theatre \
                 0 Dropbox/JH/d-toReduce \
                 0 Dropbox/JH/k-Copied \
                 0 Dropbox/JH/k-Now \
                 0 Dropbox/JH/k-Then0 \
                 0 Dropbox/JH/k-Then1 \
                 0 Dropbox/JH/k-Work \
                 0 Dropbox/Photos \
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

