#!/bin/bash

VIRTUAL_MACHINE=$1
COMMAND=${@:2}

set -e

# Switch to directory of script
cd ${0%/*}

function cleanup {
  # Try halting the machine until it is successful (vagrant sometimes fails halting machines :( )
  until vagrant halt $VIRTUAL_MACHINE 1>&2
  do
    sleep 5
  done  
}

cd vagrant
trap cleanup EXIT 1>&2 # run cleanup on exit of the bash script
vagrant up $VIRTUAL_MACHINE 1>&2
vagrant ssh $VIRTUAL_MACHINE -c "$COMMAND" -- -T

set +e
