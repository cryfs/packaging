#!/bin/bash
set -e

echo Install biicode

if cat /etc/*-release | grep raspbian; then
  dist="raspbian"
elif cat /etc/*-release | grep wheezy; then
  dist="wheezy"
elif cat /etc/*-release | grep jessie; then
  dist="jessie"
elif cat /etc/*-release | grep trusty; then
  dist="trusty"
elif cat /etc/*-release | grep precise; then
  dist="precise"
elif cat /etc/*-release | grep saucy; then
  dist="saucy"
elif cat /etc/*-release | grep quantal; then
  dist="quantal"
elif cat /etc/*-release | grep raring; then # 13.04
  dist="raring"
elif cat /etc/*-release | grep utopic; then # 14.10
  dist="utopic"
elif cat /etc/*-release | grep vivid; then # 15.04
  dist="vivid"
elif cat /etc/*-release | grep wily; then # 15.10
  dist="vivid" # 15.10 package not available, so use 15.04 one

else
  echo "Can't find a valid debian-based distribution! Please contact info@biicode.com for help or post in forum.biicode.com!"
  exit 1
fi
echo "deb http://apt_new.biicode.com $dist main" | tee /etc/apt/sources.list.d/biicode.list
wget -O /etc/apt/trusted.gpg.d/biicode.gpg http://apt_new.biicode.com/keyring.gpg
apt-get update
apt-get -y install biicode

sudo -H -u builder bii setup:cpp

set +e
