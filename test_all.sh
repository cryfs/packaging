#!/bin/bash

TAG=$1

set -e

./test.sh ubuntu-15.10-x86_64 $TAG
./test.sh ubuntu-15.04-x86_64 $TAG
./test.sh ubuntu-14.04-x86_64 $TAG
./test.sh ubuntu-12.04-x86_64 $TAG
./test.sh ubuntu-15.10-x86 $TAG
./test.sh ubuntu-15.04-x86 $TAG
./test.sh ubuntu-14.04-x86 $TAG
./test.sh ubuntu-12.04-x86 $TAG

set +e
