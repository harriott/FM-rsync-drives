#!/bin/bash
# vim: set et tw=0:

# Called from  rsync.sh

# set to 0 to exclude a directory:
includeIndexed=( 1 Dropbox/CAMusic-Europe \
                 1 Dropbox/CAMusic-Germanic \
                 1 Dropbox/CAMusic-USA \
                 1 Dropbox/CAMusic-West \
                 1 Dropbox/CAMusic-World \
                 1 Dropbox/CA-OutThere-UK \
                 1 Dropbox/CAudio-OutThere \
                 1 Dropbox/Copied \
                 1 Dropbox/JH/d-F+F \
                 1 Dropbox/JH/d-Stack \
                 1 Dropbox/JH/d-Theatre \
                 1 Dropbox/JH/k-Copied \
                 1 Dropbox/JH/k-Now \
                 1 Dropbox/JH/k-Then0 \
                 1 Dropbox/JH/k-Then1 \
                 1 Dropbox/JH/k-Work \
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

