#!/bin/bash

VIRTUAL_MACHINE=$1
TAG=$2

set -e

# Switch to directory of script
cd ${0%/*}

if [ "$VIRTUAL_MACHINE" == "" ];then
  echo Please specify virtual machine
  exit 1
fi
if [ "$TAG" == "" ];then
  echo Please specify tag
  exit 1
fi

TMPFILE=./build/cryfs_${TAG}_${VIRTUAL_MACHINE}.deb.`cat /dev/urandom | tr -cd 'a-f0-9' | head -c 8`.tmp

rm -f ./build/cryfs_${TAG}_${VIRTUAL_MACHINE}.deb
# 2x sudo, because first goes to root, second to builder user
./run_in_vm.sh $VIRTUAL_MACHINE sudo sudo -H -u builder /vagrant/build_and_output_package.sh https://github.com/cryfs/cryfs $TAG > $TMPFILE
mv $TMPFILE ./build/cryfs_${TAG}_${VIRTUAL_MACHINE}.deb

set +e
