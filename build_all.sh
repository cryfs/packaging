#!/bin/bash

TAG=$1

set -e

if [ "$TAG" == "" ];then
  echo Please specify tag
  exit 1
fi

function runbuild {
  ./build.sh $1 $TAG $2 > build/build-$1.stdout 2> build/build-$1.stderr &
}

runbuild ubuntu-15.10-x64 wily
runbuild ubuntu-15.10-x32 wily
runbuild ubuntu-15.04-x64 vivid
runbuild ubuntu-15.04-x32 vivid
runbuild ubuntu-14.04-x64 trusty
runbuild ubuntu-14.04-x32 trusty
runbuild ubuntu-12.04-x64 precise
runbuild ubuntu-12.04-x32 precise

runbuild debian-8-x64 jessie

# Wait until all finished
wait

set +e
