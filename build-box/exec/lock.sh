#!/usr/bin/env bash

set -Eeuo pipefail

cd /root/demo

if true; then
  clear
  echo
  echo "########################################################################"
  echo "#####  Locking the example environment for a reproducible build  #####"
  echo
fi

scrollcase lock example-box/linux-x86_64-cpu

if true; then
  clear
  echo
  echo "########################################################################"
  echo "#####  Committing the generated project and lock  #####"
  echo
fi

git add .
git commit -m "Initialize Scrollcase example"
