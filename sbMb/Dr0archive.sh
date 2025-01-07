#!/bin/bash

# A series of rsyncs between folders on local and portable archive media.
# alias rs0 is defined in my  $AjB/bashrc-console

ac="rsync -irtv --delete --progress $Drpbx"

  al='/run/media/jo/HDT721016SLA380/k6i-Dr0'
# al='/run/media/jo/HM250HI/k3q-Dr0'
# al='/run/media/jo/ST3320418AS/jcn-Dr0'
# al='/run/media/jo/ST380815AS/k4n-Dr0'
# al='/run/media/jo/WD1600AAJS/k46-Dr0'
# al='/run/media/jo/WD2000JD/k59-Dr0'

$ac/Copied-OutThere/ $al-Copied-OutThere
$ac/JH/Cafezoide/    $al-JH-Cafezoide
$ac/JH/CforWork/     $al-JH-CforWork
$ac/JH/Copied/       $al-JH-Copied
$ac/JH/F+F/          $al-JH-F+F
$ac/JH/IT_stack/     $al-JH-IT_stack
$ac/JH/Now/          $al-JH-Now
$ac/JH/Stack/        $al-JH-Stack
$ac/JH/Theatre0/     $al-JH-Theatre0
$ac/JH/Theatre1/     $al-JH-Theatre1
$ac/JH/Then0/        $al-JH-Then0
$ac/JH/Then1/        $al-JH-Then1
$ac/JH/toReduce/     $al-JH-toReduce
$ac/JH/Work/         $al-JH-Work
$ac/Photos/          $al-Photos

