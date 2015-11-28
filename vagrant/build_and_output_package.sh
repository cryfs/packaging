#!/bin/bash
# Build the package for the specified repository/tag and output it on stdout

REPOSITORY=$1
TAG=$2

set -e

# Switch to directory of script
cd ${0%/*}

TMPFILE=/tmp/package_${TAG}_`cat /dev/urandom | tr -cd 'a-f0-9' | head -c 8`

./build_package.sh $REPOSITORY $TAG $TMPFILE 1>&2
cat $TMPFILE
rm $TMPFILE 1>&2

set +e
