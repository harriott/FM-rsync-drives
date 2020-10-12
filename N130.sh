#!/bin/bash
# vim: set et tw=0:

# Joseph Harriott http://momentary.eu/ Last updated: Fri 20 Sep 2019

# Now outdated...

if [ -d /mnt/BX200 ]; then
    backuppath="$extmnt/SAMSUNG/rsyncBackupN130"
    intdrv=/mnt/BX200
    intdir=( "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "$intdrv/Dropbox/JH/k-Now/" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "-" \
             "$intdrv/More/" )
    backupdir=( "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                $backuppath/Dr-JH-Now/ \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                "-" \
                $backuppath/More/ )
fi

