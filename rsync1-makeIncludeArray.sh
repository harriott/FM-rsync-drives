#!/bin/bash
# vim: fdl=1 sw=2:

# $onGH/FM-rsync-drives/rsync1-makeIncludeArray.sh
#  sourced from
#   $onGH/FM-rsync-drives/rsync/sbMb/Vs.sh
#   $onGH/FM-rsync-drives/rsync/rsync0.sh

#=> make the include (or not) array
dirsSwitch=(${dirsAbstract[0]})
dirsBN=(${dirsAbstract[1]})  # base name
dirsActiveDN=(${dirsAbstract[2]})  # directory name
dirsActiveFP=(${dirsActiveDN[0]}/${dirsBN[0]})  # full path
dirsBackupDN=(${dirsAbstract[3]})
dirsBackupFP=(${dirsBackupDN[0]}/${dirsBN[0]})
iAbs=0
iAct=0
while [[ $iAbs -le ${#dirsAbstract[@]}-5 ]]; do
  ((iAbs+=4))
  ((iAct+=1))
  dirsSwitch=(${dirsSwitch[@]} ${dirsAbstract[iAbs]})
  dirsBN=(${dirsBN[@]} ${dirsAbstract[iAbs+1]})
  dirsActiveDN=(${dirsActiveDN[@]} ${dirsAbstract[iAbs+2]})
  dirsActiveFP=(${dirsActiveFP[@]} ${dirsActiveDN[iAct]}/${dirsBN[iAct]})
  dirsBackupDN=(${dirsBackupDN[@]} ${dirsAbstract[iAbs+3]})
  dirsBackupFP=(${dirsBackupFP[@]} ${dirsBackupDN[iAct]}/${dirsBN[iAct]})
done
echo "Include switches are  ${dirsSwitch[@]},"

