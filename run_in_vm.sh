#!/bin/bash

VIRTUAL_MACHINE=$1
COMMAND=${@:2}

set -e

# Switch to directory of script
cd ${0%/*}

cd vagrant
vagrant up $VIRTUAL_MACHINE
vagrant ssh $VIRTUAL_MACHINE -c "$COMMAND"
sleep 5
vagrant halt $VIRTUAL_MACHINE

set +e
