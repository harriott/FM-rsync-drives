#!/bin/bash

# Joseph Harriott - Wed 05 Jul 2023
# $onGH/FM-rsync-drives/rsync2-list_included.sh  sourced by  $onGH/FM-rsync-drives/rsync0.sh

# set -x
i=-1
included=0
for dS in "${dirsSwitch[@]}"; do
    i=$((i+1))
    if [ $dS -ne "0" ]; then
        echo -e "  ${dirsActiveDN[i]}/\e[92m${dirsBN[i]}\e[0m\e[37m -> ${dirsBackupDN[i]}/${dirsBN[i]}\e[0m"
        included=$((included+1))
    fi
done
echo "   = $included rsyncs"

