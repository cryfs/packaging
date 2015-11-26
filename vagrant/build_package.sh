#!/bin/bash
# Build the package for the specified repository/tag and store it to $DESTFILE

REPOSITORY=$1
TAG=$2
DESTFILE=$3

set -e

# Switch to directory of script
cd ${0%/*}

TMPDIR=/tmp/sourcedir-`cat /dev/urandom | tr -cd 'a-f0-9' | head -c 8`

rm -rf $TMPDIR # Just in case it already exists
./init_package.sh $REPOSITORY $TAG $TMPDIR
cd $TMPDIR
bii build -- -j5
bii test -j5
cd bii/build
make package
cp *.deb $DESTFILE
cd /
rm -rf $TMPDIR

set +e
