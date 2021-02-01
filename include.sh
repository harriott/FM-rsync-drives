#!/bin/bash
# vim: sw=2:

# sourced from  rsync.sh

#=> abstracted list of locations
# set first item to 0 to exclude a directory:
includeIndexed=(
  1 Share-AV-Stack \
  1 Share-CAT-Buddhism \
  1 Share-CAT-Buddhism-Theravada \
  1 Share-CAT-OutThere \
  1 Share-CAT-OutThere-UK \
  1 Share-IT-Copied \
  1 Share-IT-DebianBased-Copied \
  1 Share-More \
  1 Share-ThunderbirdProfiles \
  1 Share-toReduce \
  1 Sync0-JH-Cafezoide \
  1 Sync0-JH-CforWork \
  1 Sync0-JH-Copied \
  1 Sync0-JH-core \
  1 Sync0-JH-F+F \
  1 Sync0-JH-JCD-imagey-e3 \
  1 Sync0-JH-Now \
  1 Sync0-JH-Sh-81A4 \
  1 Sync0-JH-Sh-XA10 \
  1 Sync0-JH-Sh-XA2 \
  1 Sync0-JH-Stack \
  1 Sync0-JH-Technos \
  1 Sync0-JH-Theatre0 \
  1 Sync0-JH-Theatre1 \
  1 Sync0-JH-Then0 \
  1 Sync0-JH-Then1 \
  1 Sync0-JH-toReduce \
  1 Sync0-JH-TP.default-release \
  1 Sync0-JH-Work \
  1 Sync0-Photos \
  1 Sync0-Apps \
  1 Sync1-CAM-toSort \
  1 Sync1-CAM-UK \
  1 Sync1-CAM-USA \
  1 Sync1-CAMusic \
  1 Sync1-COutThere \
  1 Vs \
)
# VsPreferred=TOSHIBA
VsPreferred=HD103SJ

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

