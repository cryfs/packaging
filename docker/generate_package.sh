#!/bin/bash
# Build the package for the specified repository/tag and output it on stdout

set -e

REPOSITORY=$1
TAG=$2

# Build package and redirect all stdout output to stderr
./build_package.sh $REPOSITORY $TAG /tmp/package.deb 1>&2

# Send generated package file to stdout
cat /tmp/package.deb

# Clean up
rm /tmp/package.deb

set +e
