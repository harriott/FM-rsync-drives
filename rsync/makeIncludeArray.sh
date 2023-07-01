#!/bin/bash
# vim: fdl=1 sw=2:

# $onGH/FM-rsync-drives/rsync-makeIncludeArray.sh
# sourced from  $onGH/rsync-portabledrives/include0.sh

#=> make the include (or not) array
includeswitch=(${includeIndexed[0]})
includedir=(${includeIndexed[1]})
i=0
while [ $i -le ${#includeIndexed[@]} ]; do
  ((i+=3))
  includeswitch=(${includeswitch[@]} ${includeIndexed[i]})
  includedir=(${includedir[@]} ${includeIndexed[i+1]})
done
echo "(include switches: ${includeswitch[@]})"

