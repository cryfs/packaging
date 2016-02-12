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
rm -rf $TMPDIR
mkdir $TMPDIR
#sudo mount -t ramfs ramfs $TMPDIR
#sudo chmod 777 $TMPDIR

git clone https://github.com/cryfs/cryfs $TMPDIR/cryfs
cd $TMPDIR/cryfs
git checkout $TAG

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=off
make package -j$NUMCORES
cp *.deb $DESTFILE
cd /
#sudo umount $TMPDIR
rm -rf $TMPDIR

set +e

