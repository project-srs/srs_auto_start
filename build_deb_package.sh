#!/bin/bash

SCRIPT_DIR=`dirname $0`
cd $SCRIPT_DIR

# update date string
DATE_STR=`date '+%Y%m%d-%H%M%S'`
sed "s/[0-9]\{8\}-[0-9]\{6\}/$DATE_STR/" -i work/DEBIAN/control

# remove old deb file
rm *.deb

# build deb package
fakeroot dpkg-deb --build ./work .

