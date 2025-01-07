#!/bin/bash

# Joseph Harriott - Sat 01 Jul 2023
# $onGH/FM-rsync-drives/rsync3-do_it.sh
#  sourced by
#   $onGH/FM-rsync-drives/rsync0.sh
#   $onGH/FM-rsync-drives/sbMb/Vs.sh

i=-1
logRoot="$Storage/${script_basename%.*}"  # $Storage  is defined in my  $machBld/export-machine
logOut="$logRoot.log"
logTemp="$logRoot.tmp"; touch $logTemp
echo "vim: ft=rsynclog fdm=expr:" > $logOut
echo "" | tee -a $logOut
echo $(date)$dryrun | tee -a $logOut
underline='------------------'
nfdflag="! no SRC !"
ntdflag="! no DEST !"
j=0
for thisdir in "${dirsActiveFP[@]}"; do
    ((i++))
    if [ ${dirsSwitch[i]} -ne "0" ]; then
        if [ ! $rerr ]; then
            ((j++))
            extdd=${dirsBackupFP[i]}
            if [[ "$extdd" =~ 'K16GB500' ]] # it's a FAT32 drive
            then
                modrsc=" --modify-window=1" # don't send fraction of second changes
            else
                modrsc=""
            fi
            if [ ${drctn,,} = "t" ]; # case-insensitive test
            then
                cmd="$rsynccom$modrsc"
                fr="$thisdir"
                to="$extdd"
            else
                cmd="$rsynccom$modrsc"
                fr="$extdd"
                to="$thisdir"
            fi
            echo "" | tee -a $logOut
            printf -v include "%02d" $j
            echo "Push sync $include of $included : ${dirsBN[i]}" | tee -a $logOut
            echo $underline | tee -a $logOut
            fullcmd="$cmd $fr/ $to"
            echo ${tpf7b}$fullcmd${tpfn}
            echo $fullcmd >> $logOut
            if [ -d $fr ]; then
                if [ ! -d $to ]; then
                    if [[ -z $createTarget ]]; then
                        echo "" | tee -a $logOut
                        echo ${tpf1b}$ntdflag${tpfn}
                        echo "Action:" >> $logOut
                        echo $ntdflag >> $logOut
                        ntd=1
                    else
                        mkdir $to
                    fi
                fi  # found no destination
                if [[ -z $ntd ]]; then
                    echo ${tpf7}
                    $fullcmd 2>&1 | tee $logTemp # - disable for testing
                    if [ -s $logTemp ]; then
                        echo "" >> $logOut
                        echo "Action:" >> $logOut
                        cat $logTemp >> $logOut
                    fi
                fi  # did the work
            else  # no source
                echo "" | tee -a $logOut
                echo ${tpf1b}$nfdflag${tpfn}
                echo "Action:" >> $logOut
                echo $nfdflag >> $logOut
                nfd=1
            fi
            echo -en '\e[0m'
            # check for rsync errors
            grep -q ' error in rsync protocol data stream ' $logOut && rerr=eirpds
            grep -q ' failed: Invalid argument ' $logOut && rerr=fIa
            grep -q ' Input/output error ' $logOut && rerr=Ioe
            grep -q ' write error: Broken pipe ' $logOut && rerr=weBp
            [ $rerr ] && echo 'there was an rsync error, so not going any further'
        fi  # - only if no rsync errors
    fi
done
echo "" >> $logOut
rm $logTemp
jHM=$(date "+%j-%H%M")
outf3="$logRoot-$jHM.log"
cp $logOut $outf3
echo ''
echo "- all done, and logged to $logOut ${tpf7}(& $outf3)${tpfn}"
sed -i '/\r .\+/d' $logOut  # remove progress mess (= lines starting with carriage return)
if [ $nfd ]; then
    gvim -c "silent! /$nfdflag" $logOut
elif [ $ntd ]; then
    gvim -c "silent! /$ntdflag" $logOut
elif [ $rerr ]; then
    if [[ "$rsynccom" =~ ' --progress' ]]; then
        gvim -c "silent! /^rsync error:" $logOut
    else
        case $rerr in
            eirpds) gvim -c " error in rsync protocol data stream " $logOut;;
            fIa) gvim -c "silent! / failed: Invalid argument " $logOut;;
            Ioe) gvim -c "silent! / Input\/output error "      $logOut;;
            weBp) gvim -c "silent! / Broken pipe " $logOut;;
        esac
    fi
else
    gvim -c "silent! /^Action:" $logOut
fi

