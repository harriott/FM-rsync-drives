#!/bin/bash

# Joseph Harriott - Thu 28 Apr 2022
# included by  $onGH/rsync-portabledrives/rsync.sh

# set -x
i=-1
j=0
for thisdir in "${dirSource[@]}"; do
    if [ ! $thisdir = "-" ]; then
        # ((i++))
        # let "i++"
        i=$((i+1))
        if [ ${includeswitch[i]} -ne "0" ]; then
            echo "  $thisdir"
            # ((j++))
            j=$((j+1))
        fi
    fi
done
echo "   = $j rsyncs"
echo -e "\e[0m"

