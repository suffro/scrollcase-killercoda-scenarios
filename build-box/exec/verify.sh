#!/usr/bin/env bash

set -Eeuo pipefail

cd /root/demo

clear
printf '\nVerifying the signed box and running its self-test.\n\n'
printf '$ scrollcase verify .scrollcase/dist/boxes/example-box/1.0.0/linux-x86_64-cpu/*.release.json --self-test\n\n'

scrollcase verify \
  .scrollcase/dist/boxes/example-box/1.0.0/linux-x86_64-cpu/*.release.json \
  --self-test
