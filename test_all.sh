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

runtest ubuntu-17.10-x64
#runtest ubuntu-17.10-x32
#runtest ubuntu-17.04-x64
#runtest ubuntu-17.04-x32
#done runtest ubuntu-16.04-x64
#done runtest ubuntu-16.04-x32
#done runtest ubuntu-14.04-x64
#done runtest ubuntu-14.04-x32

runtest debian-9-x64
#runtest debian-9-x32
#done runtest debian-8-x64
#done runtest debian-8-x32

# Wait until all finished
wait

set +e
