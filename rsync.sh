#!/bin/bash
# vim: fdm=expr ft=sh.shfold:

# Joseph Harriott - Mon 09 Nov 2020

# A series of rsyncs between folders on local and portable media.
# ---------------------------------------------------------------
#   As this script performs a high-impact operation,
#   I prefer to leave it without executable permission
#   and call it from a terminal with the bash command.
#   eg: bash /<fullpath>/rsync.sh

#=> directory locations
scriptFolder=$( dirname "${BASH_SOURCE[0]}" )

#==> include list
source "$scriptFolder/include.sh"

#==> source locations on AVT661
extmnt=/run/media/jo
intdrv=/mnt/SDSSDA240G
intdir=(
  "/mnt/9QG2FFEE/Share/AV-Stack/" \
  "/mnt/9QG2FFEE/Share/Dr-CAT-Buddhism/" \
  "/mnt/9QG2FFEE/Share/Dr-CAT-Buddhism-Theravada/" \
  "/mnt/9QG2FFEE/Share/Dr-CAT-OutThere/" \
  "/mnt/9QG2FFEE/Share/Dr-CAT-OutThere-UK/" \
  "/mnt/9QG2FFEE/Share/IT-Copied/" \
  "/mnt/9QG2FFEE/Share/IT-DebianBased-Copied/" \
  "/mnt/9QG2FFEE/Share/More/" \
  "/mnt/9QG2FFEE/Share/toReduce/" \
  "$intdrv/Dropbox/Apps/" \
  "$intdrv/Dropbox/CAM-toSort/" \
  "$intdrv/Dropbox/CAM-UK/" \
  "$intdrv/Dropbox/CAM-USA/" \
  "/mnt/9QF58B0C/CAMusic/" \
  "/mnt/9QF58B0C/ThunderbirdProfiles/" \
  "$intdrv/Dropbox/JH/Cafezoide/" \
  "$intdrv/Dropbox/JH/CforWork/" \
  "$intdrv/Dropbox/JH/Copied/" \
  "$intdrv/Dropbox/JH/core/" \
  "/mnt/9QG2FFEE/Share/Dr-JH-COutThere/" \
  "$intdrv/Dropbox/JH/F+F/" \
  "$intdrv/Dropbox/JH/JCD-imagey-e3/" \
  "$intdrv/Dropbox/JH/Now/" \
  "$intdrv/Dropbox/JH/Sh-81A4/" \
  "$intdrv/Dropbox/JH/Sh-XA10/" \
  "$intdrv/Dropbox/JH/Sh-XA2/" \
  "/mnt/9QG2FFEE/Share/Dr-JH-Stack/" \
  "$intdrv/Dropbox/JH/Technos/" \
  "$intdrv/Dropbox/JH/Theatre0/" \
  "$intdrv/Dropbox/JH/Theatre1/" \
  "$intdrv/Dropbox/JH/Then0/" \
  "$intdrv/Dropbox/JH/Then1/" \
  "$intdrv/Dropbox/JH/toReduce/" \
  "$intdrv/Dropbox/JH/TP.default-release/" \
  "$intdrv/Dropbox/JH/Work/" \
  "$intdrv/Dropbox/Photos/" \
)
#==> backup locations on SM3
# This drive defines the sort order:
extdrvdir=(
  SM3/Share/AV-Stack/ \
  SM3/Share/Dr-CAT-Buddhism/ \
  SM3/Share/Dr-CAT-Buddhism-Theravada/ \
  SM3/Share/Dr-CAT-OutThere/ \
  SM3/Share/Dr-CAT-OutThere-UK/ \
  SM3/Share/IT-Copied/ \
  SM3/Share/IT-DebianBased-Copied/ \
  SM3/Share/More/ \
  SM3/Share/toReduce/ \
  SM3/Sync1/Dr-Apps/ \
  SM3/Sync1/Dr-CAM-toSort/ \
  SM3/Sync1/Dr-CAM-UK/ \
  SM3/Sync1/Dr-CAM-USA/ \
  SM3/Sync1/Dr-CAMusic/ \
  SM3/Sync1/ThunderbirdProfiles/ \
  SM3/Sync0/Dr-JH-Cafezoide/ \
  SM3/Sync0/Dr-JH-CforWork/ \
  SM3/Sync0/Dr-JH-Copied/ \
  SM3/Sync0/Dr-JH-core/ \
  SM3/Sync0/Dr-JH-COutThere/ \
  SM3/Sync0/Dr-JH-F+F/ \
  SM3/Sync0/Dr-JH-JCD-imagey-e3/ \
  SM3/Sync0/Dr-JH-Now/ \
  SM3/Sync0/Dr-JH-Sh-81A4/ \
  SM3/Sync0/Dr-JH-Sh-XA10/ \
  SM3/Sync0/Dr-JH-Sh-XA2/ \
  SM3/Sync1/Dr-JH-Stack/ \
  SM3/Sync0/Dr-JH-Technos/ \
  SM3/Sync0/Dr-JH-Theatre0/ \
  SM3/Sync0/Dr-JH-Theatre1/ \
  SM3/Sync0/Dr-JH-Then0/ \
  SM3/Sync0/Dr-JH-Then1/ \
  SM3/Sync0/Dr-JH-toReduce/ \
  SM3/Sync0/Dr-JH-TP.default-release/ \
  SM3/Sync0/Dr-JH-Work/ \
  SM3/Sync0/Dr-Photos/ \
)

#=> list the included directories
echo -en "This BASH script will run \e[1mrsync\e[0m, pushing all changes, "
echo "either to or from these local directories:"
i=-1
j=0
for thisdir in "${intdir[@]}"; do
    if [ ! $thisdir = "-" ]; then
        ((i++))
        if [ ${includeswitch[i]} -ne "0" ]; then
          echo -en "\e[92m  $thisdir\n"
          ((j++))
        fi
    fi
done
printf -v included "%02d" $j  # catches the total number of included locations
echo -e "\e[0m"

#=> ask what to do
read -p "Sync TO (T) portable drives (or dry-run (t)), or FROM (F) (or dry-run (f))? " drctn
if [ $drctn ]; then
    dryrun=''
    rsynccom="rsync -ilrt --delete"
    if [ $drctn = "T" ]; then
        read -p "Run several: ${tpf7b}$rsynccom <localdrive> <portabledrive> ? ${tpfn}" cnfrm
    elif [ $drctn = "t" ]; then
        dryrun=' - dry-run'
        rsynccom="rsync -ilnrt --delete" # dry-run
        echo "Okay, running: ${tpf7b}$rsynccom <localdrive> <portabledrivebackup>${tpfn}"
        cnfrm="y"
    elif [ $drctn = "F" ]; then
        echo "About to run several: ${tpf5b}$rsynccom <portabledrive> <localdrive>${tpfn}"
        read -p "No recovery possible from this operation, GO AHEAD? " cnfrm
    elif [ $drctn = "f" ]; then
        dryrun=' - dry-run'
        rsynccom="rsync -ilnrt --delete" # dry-run
        echo -e "Okay, running: \e[1m$rsynccom <portabledrivebackup> <localdrive>\e[0m"
        cnfrm="y"
    else
        exit
    fi
    if [ ! $cnfrm ] || [ $cnfrm != "y" ]; then exit; fi
else
    exit
fi

#=> do it
i=-1
outf=`basename ${BASH_SOURCE[0]}`
outf0="$intdrv/${outf%.*}"
outf1="$outf0.log"
outf2="$outf0.tmp"; touch $outf2
echo "vim: ft=rsynclog fdm=expr:" > $outf1
echo "" | tee -a $outf1
echo $(date)$dryrun | tee -a $outf1
underline='------------------'
nfd="! no SRC !"
ntd="! no DEST !"
j=0
for thisdir in "${intdir[@]}"; do
    ((i++))
    if [ ${includeswitch[i]} -ne "0" ]; then
        if [ ! $thisdir = "-" ]; then
            ((j++))
            extdd=${extdrvdir[i]}
            if [ ${extdd%%/*} = 'K16GB500' ] # it's a FAT32 drive
            then
                modrsc=" --modify-window=1" # don't send fraction of second changes
            else
                modrsc=""
            fi
            if [ ${drctn,,} = "t" ]; # case-insensitive test
            then
                cmd="$rsynccom$modrsc"
                fr="$thisdir"
                to="$extmnt/$extdd"
            else
                modrsc=" --modify-window=1" # don't receive fraction of second changes
                cmd="$rsynccom$modrsc"
                fr="$extmnt/$extdd"
                to="$thisdir"
            fi
            echo "" | tee -a $outf1
            printf -v include "%02d" $j
            echo "Push sync $include of $included - ${includedir[i]}" | tee -a $outf1
            echo $underline | tee -a $outf1
            fullcmd="$cmd $fr $to"
            echo ${tpf7b}$fullcmd${tpfn}
            echo $fullcmd >> $outf1
            if [ -d $fr ]; then
                if [ -d $to ]; then
                    echo ${tpf7}
                    $fullcmd 2>&1 | tee $outf2 # - disable for testing
                    if [ -s $outf2 ]; then
                        echo "" >> $outf1
                        echo "Action:" >> $outf1
                        cat $outf2 >> $outf1
                    fi
                else # no destination
                    echo "" | tee -a $outf1
                    echo ${tpf1b}$ntd${tpfn}
                    echo "Action:" >> $outf1
                    echo $ntd >> $outf1
                fi
            else # no source
                echo "" | tee -a $outf1
                echo ${tpf1b}$nfd${tpfn}
                echo "Action:" >> $outf1
                echo $nfd >> $outf1
            fi
            echo -en '\e[0m'
        fi
    fi
done
echo "" >> $outf1
rm $outf2
jHM=$(date "+%j-%H%M")
outf3="$outf0-$jHM.log"
cp $outf1 $outf3
echo ''
echo "- all done, and logged to $outf1 ${tpf7}(& $outf3)${tpfn}"
gvim -c "silent! /^Action" $outf1
exit

