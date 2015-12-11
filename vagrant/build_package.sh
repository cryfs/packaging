#!/bin/bash
# Build the package for the specified repository/tag and store it to $DESTFILE

REPOSITORY=$1
TAG=$2
DESTFILE=$3

set -e

NUMCORES=`grep -c ^processor /proc/cpuinfo`
echo Using $NUMCORES cores

# Switch to directory of script
cd ${0%/*}

if [ "$REPOSITORY" == "" ];then
  echo Please specify repository
  exit 1
fi
if [ "$TAG" == "" ];then
  echo Please specify tag
  exit 1
fi
if [ "$DESTFILE" == "" ]; then
  echo Please specify destdir
fi

TMPDIR=/tmp/sourcedir-`cat /dev/urandom | tr -cd 'a-f0-9' | head -c 8`

rm -rf $DESTFILE
rm -rf $TMPDIR # Just in case it already exists
mkdir $TMPDIR
#sudo mount -t ramfs ramfs $TMPDIR
#sudo chmod 777 $TMPDIR
./init_package.sh $REPOSITORY $TAG $TMPDIR
cd $TMPDIR
bii build -- -j$NUMCORES
bii test -j$NUMCORES
cd bii/build
make package
cp *.deb $DESTFILE
cd /
#sudo umount $TMPDIR
rm -rf $TMPDIR

set +e
