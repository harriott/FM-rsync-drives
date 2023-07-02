#!/bin/bash

# Joseph Harriott - Sat 01 Jul 2023
# $onGH/FM-rsync-drives/rsync3-do_it.sh  sourced by  $onGH/FM-rsync-drives/rsync0.sh

i=-1
outf0="$Storage/${outf%.*}"  # $Storage  is defined in my  $machBld/export-machine
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
            if [ ! $rerr ]; then
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
                    # modrsc=" --modify-window=1" # don't receive fraction of second changes
                    cmd="$rsynccom$modrsc"
                    fr="$extmnt/$extdd"
                    to="$thisdir"
                fi
                echo "" | tee -a $outf1
                printf -v include "%02d" $j
                echo "Push sync $include of $included : ${includeVs[i]}" | tee -a $outf1
                echo $underline | tee -a $outf1
                fullcmd="$cmd $fr/ $to"
                echo ${tpf7b}$fullcmd${tpfn}
                echo $fullcmd >> $outf1
                if [ -d $fr ]; then
                    if [ ! -d $to ]; then
                        if [[ -z $createTarget ]]; then
                            echo "" | tee -a $outf1
                            echo ${tpf1b}$ntdflag${tpfn}
                            echo "Action:" >> $outf1
                            echo $ntdflag >> $outf1
                            ntd=1
                        else
                            mkdir $to
                        fi
                    fi  # found no destination
                    if [[ -z $ntd ]]; then
                        echo ${tpf7}
                        $fullcmd 2>&1 | tee $outf2 # - disable for testing
                        echo $?
                        if [ -s $outf2 ]; then
                            echo "" >> $outf1
                            echo "Action:" >> $outf1
                            cat $outf2 >> $outf1
                        fi
                    fi  # did the work
                else  # no source
                    echo "" | tee -a $outf1
                    echo ${tpf1b}$nfdflag${tpfn}
                    echo "Action:" >> $outf1
                    echo $nfdflag >> $outf1
                    nfd=1
                fi
                echo -en '\e[0m'
                # check for rsync errors
                grep -q ' failed: Invalid argument ' $outf1 && rerr=fIa
                grep -q ' Input/output error ' $outf1 && rerr=Ioe
                grep -q ' write error: Broken pipe ' $outf1 && rerr=Ioe
                [ $rerr ] && echo 'there was an rsync error, so not going any further'
            fi  # - only if no rsync errors
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
sed -i '/\r .\+/d' $outf1  # remove progress mess (= lines starting with carriage return)
if [ $nfd ]; then
    gvim -c "silent! /$nfdflag" $outf1
elif [ $ntd ]; then
    gvim -c "silent! /$ntdflag" $outf1
elif [ $rerr ]; then
    if [[ "$rsynccom" =~ ' --progress' ]]; then
        gvim -c "silent! /^rsync error:" $outf1
    else
        case $rerr in
            fIa) gvim -c "silent! / failed: Invalid argument " $outf1;;
            Ioe) gvim -c "silent! / Input\/output error "      $outf1;;
        esac
    fi
else
    gvim -c "silent! /^Action:" $outf1
fi

