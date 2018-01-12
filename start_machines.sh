#!/bin/bash

set -e

# Switch to directory of script
cd ${0%/*}

cd vagrant
#vagrant up --provider=google ubuntu-14.04-x64 debian-8-x64
vagrant up --provider=digital_ocean ubuntu-17.10-x64 ubuntu-17.10-x32 ubuntu-17.04-x64 ubuntu-17.04-x32 ubuntu-16.04-x64 ubuntu-16.04-x32 ubuntu-14.04-x64 ubuntu-14.04-x32 debian-9-x64 debian-9-x32 debian-8-x64 debian-8-x32
# TODO Once google image for ubuntu 16.10 x64 is available, use that instead
#vagrant up ubuntu-16.10-x32 ubuntu-16.04-x64

# Reload debian machine (needs that because it needs an updated kernel)
vagrant reload debian-8-x64
vagrand reload debian-8-x32

set +e
