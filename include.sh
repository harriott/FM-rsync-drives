#!/bin/bash
# vim: fdm=expr ft=sh.shfold sw=2:

# sourced from  rsync.sh

#=> abstracted list of locations
# set first item to 0 to exclude a directory:
includeIndexed=(
  0 Share-AV-Stack \
  0 Share-CAT-Buddhism \
  0 Share-CAT-Buddhism-Theravada \
  0 Share-CAT-OutThere \
  0 Share-CAT-OutThere-UK \
  1 Share-IT-Copied \
  0 Share-IT-DebianBased-Copied \
  0 Share-More \
  0 Share-toReduce \
  0 Sync0-Apps \
  0 Sync1-CAM-toSort \
  0 Sync1-CAM-UK \
  0 Sync1-CAM-USA \
  0 Sync1-CAMusic \
  0 Sync1-ThunderbirdProfiles \
  0 Sync0-JH-Cafezoide \
  0 Sync0-JH-CforWork \
  0 Sync0-JH-Copied \
  0 Sync0-JH-core \
  0 Sync0-JH-COutThere \
  0 Sync0-JH-F+F \
  0 Sync0-JH-JCD-imagey-e3 \
  0 Sync0-JH-Now \
  0 Sync0-JH-Sh-81A4 \
  0 Sync0-JH-Sh-XA10 \
  0 Sync0-JH-Sh-XA2 \
  0 Sync1-JH-Stack \
  0 Sync0-JH-Technos \
  0 Sync0-JH-Theatre0 \
  0 Sync0-JH-Theatre1 \
  0 Sync0-JH-Then0 \
  0 Sync0-JH-Then1 \
  0 Sync0-JH-toReduce \
  0 Sync0-JH-TP.default-release \
  0 Sync0-JH-Work \
  0 Sync0-Photos \
)
#=> make the include array
includeswitch=(${includeIndexed[0]})
includedir=(${includeIndexed[1]})
i=0
while [ $i -le ${#includeIndexed[@]} ]; do
    ((i+=2))
    includeswitch=(${includeswitch[@]} ${includeIndexed[i]})
    includedir=(${includedir[@]} ${includeIndexed[i+1]})
done
echo "(include switches: ${includeswitch[@]})"

