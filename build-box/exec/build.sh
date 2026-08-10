#!/usr/bin/env bash

set -Eeuo pipefail

cd /root/demo

if true; then
  clear
  echo
  title="Creating a local signing key for the demo"
  echo "##############${title//?/#}"
  echo "#####  $title  #####"
  echo
fi

scrollcase keygen

if true; then
  clear
  echo
  title="Building and signing the locked Linux CPU box"
  echo "##############${title//?/#}"
  echo "#####  $title  #####"
  echo
fi

scrollcase build example-box/linux-x86_64-cpu --weights embed
