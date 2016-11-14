#!/bin/bash
# vim: set et tw=0:

# Called from  rsync.sh

# set to 0 to exclude a directory:
includeIndexed=( 1 Dropbox/Copied \
                 0 Dropbox/Copied-Music-toPlay \
                 0 Dropbox/Copied-OutThere-Audio \
                 0 Dropbox/Copied-UK-Audio \
                 0 Dropbox/JH/d-F+F \
                 0 Dropbox/JH/d-Stack \
                 0 Dropbox/JH/d-Theatre \
                 0 Dropbox/JH/k-Copied \
                 0 Dropbox/JH/k-Now \
                 0 Dropbox/JH/k-Then0 \
                 0 Dropbox/JH/k-Then1 \
                 0 Dropbox/JH/k-Work \
                 0 Dropbox/Photos \
                 0 IT-Copied \
                 0 IT-DebianBased-Copied \
                 1 More)
# get the include array:
include=(${includeIndexed[0]})
i=0
while [ $i -le ${#includeIndexed[@]} ]; do
    ((i+=2))
    include=(${include[@]} ${includeIndexed[i]})
done
echo "(include switches: ${include[@]})"

