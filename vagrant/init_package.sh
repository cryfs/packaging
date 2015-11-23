#!/bin/bash
# Load the tag from the repository and configure biicode

REPOSITORY=$1
TAG=$2
DESTDIR=$3

set -e

git clone $REPOSITORY $DESTDIR
cd $DESTDIR
git checkout $TAG
bii init -L
bii configure -D CMAKE_BUILD_TYPE=Release || bii configure -D CMAKE_BUILD_TYPE=Release

set +e
