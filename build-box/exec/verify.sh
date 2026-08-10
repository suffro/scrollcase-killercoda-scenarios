#!/usr/bin/env bash

set -Eeuo pipefail
{ set +x; } 2>/dev/null

cd /root/demo

clear
echo
echo "########################################################################"
echo "#####  Verifying the signed box and running its self-test  #####"
echo
echo '$ scrollcase verify .scrollcase/dist/boxes/example-box/1.0.0/linux-x86_64-cpu/*.release.json --self-test'
echo

scrollcase verify \
  .scrollcase/dist/boxes/example-box/1.0.0/linux-x86_64-cpu/*.release.json \
  --self-test
