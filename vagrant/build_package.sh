#!/bin/bash
# Build the package for the specified repository/tag and store it to $DESTFILE

REPOSITORY=$1
TAG=$2
DESTFILE=$3

set -e

# Switch to directory of script
cd ${0%/*}

rm -rf /tmp/sourcedir
./init_package.sh $REPOSITORY $TAG /tmp/sourcedir
cd /tmp/sourcedir
bii build -- -j5
bii test -j5
cd bii/build
make package
cp *.deb $DESTFILE
cd /
rm -rf /tmp/sourcedir

set +e
