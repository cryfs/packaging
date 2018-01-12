#!/bin/bash

TAG=$1

#set -e

if [ "$TAG" == "" ];then
  echo Please specify tag
  exit 1
fi

function runbuild {
  cd vagrant ; vagrant up $1 ; cd ..
  ./build.sh $1 $TAG $2 > build/build-$1.stdout 2> build/build-$1.stderr
  cd vagrant ; vagrant halt $1 ; cd ..
}

#runbuild ubuntu-17.10-x64
runbuild ubuntu-17.10-x32
runbuild ubuntu-17.04-x64
runbuild ubuntu-17.04-x32
#runbuild ubuntu-16.04-x64
#runbuild ubuntu-16.04-x32
#runbuild ubuntu-14.04-x64
#runbuild ubuntu-14.04-x32

#runbuild debian-9-x64
runbuild debian-9-x32
#runbuild debian-8-x64
#runbuild debian-8-x32

#set +e
