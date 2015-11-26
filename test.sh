#!/bin/bash

VIRTUAL_MACHINE=$1
TAG=$2

set -e

# Switch to directory of script
cd ${0%/*}

./run_in_vm.sh $VIRTUAL_MACHINE /vagrant/test.sh $TAG

set +e
