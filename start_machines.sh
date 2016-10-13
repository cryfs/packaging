#!/bin/bash

set -e

# Switch to directory of script
cd ${0%/*}

cd vagrant
vagrant up --provider=google ubuntu-16.04-x64 ubuntu-14.04-x64 ubuntu-12.04-x64 debian-8-x64
vagrant up --provider=digital_ocean ubuntu-16.04-x32 ubuntu-14.04-x32 ubuntu-12.04-x32 debian-8-x32 ubuntu-16.10-x64
# TODO Once google image for ubuntu 16.10 x64 is available, use that instead
vagrant up ubuntu-16.10-x32

# Reload debian machine (needs that because it needs an updated kernel)
vagrant reload debian-8-x64

set +e
