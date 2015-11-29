#!/bin/bash

TAG=$1

set -e

if [ "$TAG" == "" ];then
  echo Please specify tag
  exit 1
fi

function runbuild {
  ./build.sh $1 $TAG > build/build-$1.stdout 2> build/build-$1.stderr &
}

runbuild ubuntu-15.10-x64
runbuild ubuntu-15.10-x32
runbuild ubuntu-15.04-x64
runbuild ubuntu-15.04-x32
runbuild ubuntu-14.04-x64
runbuild ubuntu-14.04-x32
runbuild ubuntu-12.04-x64
runbuild ubuntu-12.04-x32

runbuild debian-8-x64
runbuild debian-8-x32

# Wait until all finished
wait

set +e
