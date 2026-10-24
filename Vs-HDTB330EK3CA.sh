#!/bin/bash
# vim: fdl=1 sw=2:

# ensure targets for  TOSHIBA HDTB330EK3CA

# bash $onGH/FM-rsync-drives/Vs-HDTB330EK3CA.sh

for td in \
  Vs-forChildren \
  Vs-forChildren-best \
  Vs-forChildren-best-Europe \
  Vs-forChildren-best-US \
  Vs-forChildren-unseen \
  Vs-story \
  Vs-story-favs \
  Vs-story-favs-US \
  Vs-story-favs-US-bad-guys \
  Vs-story-fun \
  Vs-story-unseen \
  Vs-story-US \
  Vs-story-war \
  ;do tp=/run/media/jo/HDTB330EK3CA/$td; [ -d $tp ] || mkdir $tp; done

