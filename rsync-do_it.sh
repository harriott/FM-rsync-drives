#!/bin/bash

# Joseph Harriott - Tue 26 Apr 2022
# included by  $onGH/rsync-portabledrives/rsync.sh

i=-1
outf0="$Storage/${outf%.*}"  # $Storage  is defined in my  $MACHINE/export-machine
outf1="$outf0.log"
outf2="$outf0.tmp"; touch $outf2
echo "vim: ft=rsynclog fdm=expr:" > $outf1
echo "" | tee -a $outf1
echo $(date)$dryrun | tee -a $outf1
underline='------------------'
nfdflag="! no SRC !"
ntdflag="! no DEST !"
j=0
for thisdir in "${dirSource[@]}"; do
    ((i++))
    if [ ${includeswitch[i]} -ne "0" ]; then
        if [ ! $thisdir = "-" ]; then
            if [ ! $re ]; then
                ((j++))
                extdd=${dirTarget[i]}
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
                        echo $?
                        if [ -s $outf2 ]; then
                            echo "" >> $outf1
                            echo "Action:" >> $outf1
                            cat $outf2 >> $outf1
                        fi
                    else # no destination
                        echo "" | tee -a $outf1
                        echo ${tpf1b}$ntdflag${tpfn}
                        echo "Action:" >> $outf1
                        echo $ntdflag >> $outf1
                        ntd=1
                    fi
                else # no source
                    echo "" | tee -a $outf1
                    echo ${tpf1b}$nfdflag${tpfn}
                    echo "Action:" >> $outf1
                    echo $nfdflag >> $outf1
                    nfd=1
                fi
                echo -en '\e[0m'
                # check for rsync errors
                grep -q ' failed: Invalid argument ' $outf1 && re=fIa
                grep -q ' Input/output error ' $outf1 && re=Ioe
                [ $re ] && echo 'there was an rsync error, so not going any further'
            fi
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
if [ $nfd ]; then
    gvim -c "silent! /$nfdflag" $outf1
elif [ $ntd ]; then
    gvim -c "silent! /$ntdflag" $outf1
elif [ $re ]; then
    case $re in
        fIa) gvim -c "silent! / failed: Invalid argument " $outf1;;
        Ioe) gvim -c "silent! / Input\/output error "      $outf1;;
    esac
else
    gvim -c "silent! /^Action" $outf1
fi

