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


./run_in_vm.sh $VIRTUAL_MACHINE sudo -H -u builder /vagrant/test.sh $TAG

set +e
