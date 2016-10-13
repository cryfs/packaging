#!/bin/bash

TAG=$1

#set -e

if [ "$TAG" == "" ];then
  echo Please specify tag
  exit 1
fi

function runtest {
  cd vagrant ; vagrant up $1 ; cd ..
  ./test.sh $1 $TAG > build/test-$1.stdout 2> build/test-$1.stderr
  cd vagrant ; vagrant halt $1 ; cd ..
}

runtest ubuntu-16.04-x64
runtest ubuntu-16.04-x32
runtest ubuntu-14.04-x64
runtest ubuntu-14.04-x32
runtest ubuntu-12.04-x64
runtest ubuntu-12.04-x32

runtest debian-8-x64
runtest debian-8-x32

#set +e
