#!/bin/bash
# vim: fdl=1 sw=2:

# sourced from  $onGH/rsync-portabledrives/include0.sh

#=> make the include array
includeswitch=(${includeIndexed[0]})
includedir=(${includeIndexed[1]})
i=0
while [ $i -le ${#includeIndexed[@]} ]; do
  ((i+=2))
  includeswitch=(${includeswitch[@]} ${includeIndexed[i]})
  includedir=(${includedir[@]} ${includeIndexed[i+1]})
done
echo "(include switches: ${includeswitch[@]})"

