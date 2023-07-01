#!/bin/bash

# Joseph Harriott - Mon 16 May 2022
# $onGH/FM-rsync-drives/list_included.sh  sourced by  $onGH/FM-rsync-drives/rsync.sh

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

