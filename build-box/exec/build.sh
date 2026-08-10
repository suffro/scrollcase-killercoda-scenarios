#!/usr/bin/env bash

set -Eeuo pipefail

cd /root/demo

if true; then
  clear
  echo
  echo "########################################################################"
  echo "#####  Creating a local signing key for the demo  #####"
  echo
fi

scrollcase keygen

if true; then
  clear
  echo
  echo "########################################################################"
  echo "#####  Building and signing the locked Linux CPU box  #####"
  echo
fi

scrollcase build example-box/linux-x86_64-cpu --weights embed
