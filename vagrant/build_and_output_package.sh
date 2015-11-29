#!/bin/bash
# Build the package for the specified repository/tag and output the package file on stdout (for piping)

REPOSITORY=$1
TAG=$2

set -e

# Switch to directory of script
cd ${0%/*}

if [ "$REPOSITORY" == "" ];then
  echo Please specify repository
  exit 1
fi
if [ "$TAG" == "" ];then
  echo Please specify tag
  exit 1
fi

TMPFILE=/tmp/package_${TAG}_`cat /dev/urandom | tr -cd 'a-f0-9' | head -c 8`

./build_package.sh $REPOSITORY $TAG $TMPFILE 1>&2
cat $TMPFILE
rm $TMPFILE 1>&2

set +e
