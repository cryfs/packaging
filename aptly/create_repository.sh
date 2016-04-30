#!/bin/bash

# Needs environment variables: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, GPG_HOMEDIR

# OS: "debian" or "ubuntu"
OS=$1
# OS_DISTRIBUTION: "wily", "vivid", "jessie", ...
OS_DISTRIBUTION=$2
# DEB_DIRECTORY: Directory that contains the .deb files
DEB_DIRECTORY=$3

CONTAINER_NAME=cryfs-aptly

GPG_TMPDIR=/tmp/gpgdir-`cat /dev/urandom | tr -cd 'a-f0-9' | head -c 8`

set -e

# Switch to directory of script
cd ${0%/*}

# Check env variables are present

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
    echo "Need environment variable AWS_ACCESS_KEY_ID"
    exit 1
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
    echo "Need environment variable AWS_SECRET_ACCESS_KEY"
    exit 1
fi

if [ -z "$GPG_HOMEDIR" ]; then
    echo "Need environment variable GPG_HOMEDIR"
    exit 1
fi

# Copy gpg-homedir to /tmp/gpg-homedir (needed in case the homedir is stored in cryfs)
function cleanup {
  rm  -rf $GPG_TMPDIR
}
trap cleanup EXIT
rm -rf $GPG_TMPDIR
cp -R $GPG_HOMEDIR $GPG_TMPDIR

./build.sh
docker run -ti -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -v "$DEB_DIRECTORY:/debfiles" -v "$GPG_TMPDIR:/root/.gnupg" cryfs/aptly create_repository.sh $OS $OS_DISTRIBUTION /debfiles

set +e

