#!/bin/bash

# Needs environment variables: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, GPG_HOMEDIR

set -e

# Switch to directory of script
cd ${0%/*}

./create_repository.sh ubuntu yakkety $(pwd)/../build/yakkety
./create_repository.sh ubuntu xenial $(pwd)/../build/xenial
./create_repository.sh ubuntu trusty $(pwd)/../build/trusty
./create_repository.sh ubuntu precise $(pwd)/../build/precise

./create_repository.sh debian jessie $(pwd)/../build/jessie

set +e
