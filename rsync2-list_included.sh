#!/bin/bash

# Joseph Harriott - Sat 01 Jul 2023
# $onGH/FM-rsync-drives/rsync2-list_included.sh  sourced by  $onGH/FM-rsync-drives/rsync0.sh

# set -x
i=-1
included=0
for thisdir in "${dirSource[@]}"; do
    if [ ! $thisdir = "-" ]; then
        i=$((i+1))
        if [ ${includeswitch[i]} -ne "0" ]; then
            echo "  $thisdir"
            included=$((included+1))
        fi
    fi
done
echo "   = $included rsyncs"
echo -e "\e[0m"

