#!/bin/bash
# vim: sw=2:

# sourced from  $onGH/rsync-portabledrives/rsync.sh

#=> 0 abstracted list of locations
# set first item to 0 to exclude a directory:
includeIndexed=(
  1 0-Dr-JH-Cafezoide \
  1 0-Dr-JH-CforWork \
  1 0-Dr-JH-copied \
  1 0-Dr-JH-core \
  1 0-Dr-JH-F+F \
  1 0-Dr-JH-JCD-imagey-e3 \
  1 0-Dr-JH-now \
  1 0-Dr-JH-Sh-81A4 \
  1 0-Dr-JH-Sh-XA10II \
  1 0-Dr-JH-Sh-XA2 \
  1 0-Dr-JH-Stack \
  1 0-Dr-JH-technos \
  1 0-Dr-JH-Theatre0 \
  1 0-Dr-JH-Theatre1 \
  1 0-Dr-JH-Then0 \
  1 0-Dr-JH-Then1 \
  1 0-Dr-JH-toReduce \
  1 0-Dr-JH-T91-default-release \
  1 0-Dr-JH-work \
  1 0-Dr-Photos \
  1 1-Dr-Apps \
  1 1-Dr-CAM-favs \
  1 1-Dr-CAM-toSort0 \
  1 1-Dr-CAM-toSort1 \
  1 1-Dr-CAM-toSort1-UK \
  1 1-Dr-CAM-toSort1-USA \
  1 1-Dr-COutThere \
  1 2-Sync2 \
  1 2-Dr-CAT-Buddhism \
  1 2-Dr-CAT-OutThere \
  1 2-Dr-CAT-OutThere-UK \
  1 2-IT-Copied \
  1 3-Vs-do \
  1 3-Vs-forChildren-best \
  1 3-Vs-forChildren-best-Europe \
  1 3-Vs-forChildren-best-US \
  1 3-Vs-forChildren-unseen \
  1 3-Vs-inform-arts \
  1 3-Vs-inform-belief \
  1 3-Vs-inform-history \
  1 3-Vs-inform-other \
  1 3-Vs-inform-technos \
  1 3-Vs-inform-war \
  1 3-Vs-literature \
  1 3-Vs-nature \
  1 3-Vs-story \
  1 3-Vs-story-favs \
  1 3-Vs-story-favs-US \
  1 3-Vs-story-fun \
  1 3-Vs-story-unseen \
  1 3-Vs-story-US \
  1 3-Vs-story-war \
  1 3-Vs-theatre \
)
# VsPreferred=TOSHIBA
VsPreferred=HD103SJ

#=> 1 make the include array
source $onGH/rsync-portabledrives/include1.sh

