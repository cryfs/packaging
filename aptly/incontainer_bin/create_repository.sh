#!/bin/bash

OS=$1
OS_DISTRIBUTION=$2
DEB_DIRECTORY=$3

set -e

# Switch to directory of script
cd ${0%/*}

aptly repo create -distribution=$OS_DISTRIBUTION -component=main reponame
aptly repo add reponame $DEB_DIRECTORY
aptly repo show -with-packages reponame
aptly snapshot create reponame-snapshot from repo reponame
aptly snapshot verify reponame-snapshot
aptly snapshot list
aptly publish snapshot reponame-snapshot s3:$OS:

set +e

