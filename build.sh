#!/bin/bash

VIRTUAL_MACHINE=$1
TAG=$2

set -e

# Switch to directory of script
cd ${0%/*}

rm -f ./build/cryfs_${TAG}_${VIRTUAL_MACHINE}.deb
./run_in_vm.sh $VIRTUAL_MACHINE /vagrant/build_and_output_package.sh https://github.com/cryfs/cryfs $TAG > ./build/cryfs_${TAG}_${VIRTUAL_MACHINE}.deb

set +e
