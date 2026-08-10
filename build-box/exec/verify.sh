#!/usr/bin/env bash

set -Eeuo pipefail

cd /root/demo

if true; then
  clear
  echo
  echo "########################################################################"
  echo "#####  Verifying the signed box and running its self-test  #####"
  echo
fi

scrollcase verify .scrollcase/dist/boxes/example-box/1.0.0/linux-x86_64-cpu/*.release.json --self-test
