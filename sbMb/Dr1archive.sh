#!/bin/bash
# vim: set et tw=0:

# Joseph Harriott

# A series of rsyncs between folders on local and portable archive media.

ac="rsync -irtv --delete --progress $Drpbx"

# al='/run/media/jo/HM250HI/k3q-Dr1'
# al='/run/media/jo/ST380815AS/k4n-Dr1'
# al='/run/media/jo/WD1600AAJS/k46-Dr1'
  al='/run/media/jo/WD2000JD/k59-Dr1'

$ac/Apps/       $al-Apps
$ac/CAM-toSort/ $al-CAM-toSort
$ac/CAM-UK/     $al-CAM-UK
$ac/CAM-USA/    $al-CAM-USA
$ac/CAMusic/    $al-CAMusic
$ac/JH/Stack/   $al-JH-Stack/
