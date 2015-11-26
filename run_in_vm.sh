#!/bin/bash

VIRTUAL_MACHINE=$1
COMMAND=${@:2}

set -e

# Switch to directory of script
cd ${0%/*}

cd vagrant
vagrant up $VIRTUAL_MACHINE
vagrant ssh $VIRTUAL_MACHINE -c "$COMMAND"
# Try halting the machine until it is successful (vagrant sometimes fails halting machines :( )
until vagrant halt $VIRTUAL_MACHINE
do
  sleep 5
done

set +e
