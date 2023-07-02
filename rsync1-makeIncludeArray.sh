#!/bin/bash
# vim: fdl=1 sw=2:

# $onGH/FM-rsync-drives/rsync1-makeIncludeArray.sh
#  sourced from
#   $onGH/FM-rsync-drives/rsync/sbMb/Vs.sh
#   $onGH/FM-rsync-drives/rsync/rsync0.sh

#=> make the include (or not) array
includeswitch=(${includeIndexed[0]})
echo ${includeswitch[@]}
includeVs=(${includeIndexed[1]})
includeSource=(${includeIndexed[2]})
i=0
while [ $i -le ${#includeIndexed[@]} ]; do
  ((i+=3))
  includeswitch=(${includeswitch[@]} ${includeIndexed[i]})
  includeVs=(${includeVs[@]} ${includeIndexed[i+1]})
  includeSource=(${includeSource[@]} ${includeIndexed[i+2]})
done
echo "(include switches: ${includeswitch[@]})"
echo ${includeVs[@]}
echo ${includeSource[@]}

