#!/bin/bash

# Needs environment variables: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, GPG_HOMEDIR

set -e

# Switch to directory of script
cd ${0%/*}

./create_repository.sh ubuntu wily $(pwd)/../build/wily
./create_repository.sh ubuntu vivid $(pwd)/../build/vivid
./create_repository.sh ubuntu trusty $(pwd)/../build/trusty
./create_repository.sh ubuntu precise $(pwd)/../build/precise

./create_repository.sh debian jessie $(pwd)/../build/jessie

set +e
