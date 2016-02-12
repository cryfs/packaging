#!/bin/bash
# Build the specified tag and run all tests

TAG=$1

set -e

NUMCORES=`grep -c ^processor /proc/cpuinfo`
echo Using $NUMCORES cores

# Switch to directory of script
cd ${0%/*}

TMPDIR=/tmp/sourcedir-`cat /dev/urandom | tr -cd 'a-f0-9' | head -c 8`

rm -rf $TMPDIR
mkdir $TMPDIR
#sudo mount -t ramfs ramfs $TMPDIR
#sudo chmod 777 $TMPDIR

git clone https://github.com/cryfs/cryfs $TMPDIR/cryfs
cd $TMPDIR/cryfs
git checkout $TAG

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug -DBUILD_TESTING=on
make -j$NUMCORES

./test/cpp-utils/cpp-utils-test --gtest_also_run_disabled_tests
./test/parallelaccessstore/parallelaccessstore-test --gtest_also_run_disabled_tests
./test/blockstore/blockstore-test --gtest_also_run_disabled_tests
./test/blobstore/blobstore-test --gtest_also_run_disabled_tests
./test/fspp/fspp-test --gtest_also_run_disabled_tests
./test/cryfs/cryfs-test --gtest_also_run_disabled_tests

cd /
#sudo umount $TMPDIR
rm -rf $TMPDIR

set +e
