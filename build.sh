#!/bin/bash

VIRTUAL_MACHINE=$1
TAG=$2

set -e

# Switch to directory of script
cd ${0%/*}

cd vagrant
vagrant up $VIRTUAL_MACHINE
vagrant ssh $VIRTUAL_MACHINE -c "/vagrant/build_package.sh https://github.com/cryfs/cryfs $TAG /vagrant/build/cryfs_${TAG}_${VIRTUAL_MACHINE}.deb"
sleep 2
vagrant halt $VIRTUAL_MACHINE

set +e
