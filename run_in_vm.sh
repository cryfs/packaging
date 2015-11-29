#!/bin/bash

VIRTUAL_MACHINE=$1
COMMAND=${@:2}

set -e

# Switch to directory of script
cd ${0%/*}

cd vagrant
vagrant ssh $VIRTUAL_MACHINE -c "$COMMAND" -- -T

set +e
