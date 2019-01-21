#!/bin/bash

set -e

# Switch to directory of script
cd ${0%/*}

sudo docker build -t cryfs/aptly .

set +e
