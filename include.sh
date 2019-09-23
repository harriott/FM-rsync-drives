#!/bin/bash
# vim: set et tw=0:

# Called from  rsync.sh

# set first item to 0 to exclude a directory:
includeIndexed=(
  0 Share-AV-Stack \
  0 Share-CAT-Buddhism \
  0 Share-CAT-Buddhism-Theravada \
  0 Share-CAT-OutThere \
  0 Share-CAT-OutThere-UK \
  0 Share-IT-Copied \
  0 Share-IT-DebianBased-Copied \
  0 Share-More \
  1 Share-toReduce \
  0 Sync0-Copied-OutThere \
  0 Sync0-JH-Copied \
  0 Sync0-JH-F+F \
  0 Sync0-JH-IT_stack \
  0 Sync0-JH-Now \
  0 Sync0-JH-Theatre0 \
  0 Sync0-JH-Theatre1 \
  0 Sync0-JH-Then0 \
  0 Sync0-JH-Then1 \
  0 Sync0-JH-toReduce \
  0 Sync0-JH-Work \
  0 Sync0-Photos \
  0 Sync1-CAM-fromSharon \
  0 Sync1-CAMusic \
  0 Sync1-JH-Stack \
)
# get the include array:
include=(${includeIndexed[0]})
i=0
while [ $i -le ${#includeIndexed[@]} ]; do
    ((i+=2))
    include=(${include[@]} ${includeIndexed[i]})
done
echo "(include switches: ${include[@]})"

