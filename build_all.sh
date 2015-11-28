#!/bin/bash

TAG=$1

set -e

./build.sh ubuntu-15.10-x86_64 $TAG
./build.sh ubuntu-15.04-x86_64 $TAG
./build.sh ubuntu-14.04-x86_64 $TAG
./build.sh ubuntu-12.04-x86_64 $TAG
./build.sh debian-8-x86_64 $TAG
./build.sh ubuntu-15.10-x86 $TAG
./build.sh ubuntu-15.04-x86 $TAG
./build.sh ubuntu-14.04-x86 $TAG
./build.sh ubuntu-12.04-x86 $TAG
./build.sh debian-8-x86 $TAG

set +e
