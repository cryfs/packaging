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

runbuild ubuntu-20.10-x64
runbuild ubuntu-20.04-x64
runbuild ubuntu-18.04-x64
runbuild debian-10-x64
runbuild debian-9-x64

# Wait until all finished
wait

set +e
