#!/bin/bash

TAG=$1

set -e

if [ "$TAG" == "" ];then
  echo Please specify tag
  exit 1
fi

function runtest {
  ./test.sh $1 $TAG > build/test-$1.stdout 2> build/test-$1.stderr &
}

runtest ubuntu-20.10-x64
runtest ubuntu-20.04-x64
runtest ubuntu-18.04-x64
runtest debian-10-x64
runtest debian-9-x64

# Wait until all finished
wait

set +e
