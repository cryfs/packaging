#!/bin/bash
# Build the package for the specified repository/tag and store it to $DESTFILE

TAG=$1

set -e

function checkout {
  git clone $2 $1
  cd $1
  git checkout $TAG
  cd ..
}

function run_test {
  bii build --target messmer_$1_test_main -- -j5
  ./bin/messmer_$1_test_main
}

# Switch to directory of script
cd ${0%/*}

rm -rf /tmp/sourcedir
mkdir /tmp/sourcedir
cd /tmp/sourcedir
bii init
mkdir blocks
mkdir blocks/messmer
cd blocks/messmer
checkout cpp-utils https://github.com/smessmer/cpp-utils
checkout blockstore https://github.com/cryfs/blockstore
checkout blobstore https://github.com/cryfs/blobstore
checkout fspp https://github.com/cryfs/fspp
checkout cryfs https://github.com/cryfs/cryfs
cd ../..
run_test cpp-utils
run_test blockstore
run_test blobstore
run_test fspp
run_test cryfs

cd ..
rm -rf /tmp/sourcedir

set +e
