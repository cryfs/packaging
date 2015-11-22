#!/bin/bash
# Build the package for the specified repository/tag and store it to $DESTFILE

REPOSITORY=$1
TAG=$2
DESTFILE=$3

set -e

./init_package.sh $REPOSITORY $TAG /tmp/sourcedir
cd /tmp/sourcedir
bii build --target messmer_cryfs_test_main
#./bin/messmer_cryfs_test_main
bii build -- -j5
cd bii/build
make package
cp *.deb $DESTFILE
cd /
rm -rf /tmp/sourcedir

set +e
