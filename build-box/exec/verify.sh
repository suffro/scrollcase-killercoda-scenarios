#!/usr/bin/env bash

set -Eeuo pipefail

cd /root/demo

scrollcase verify \
  .scrollcase/dist/boxes/example-box/1.0.0/linux-x86_64-cpu/*.release.json \
  --self-test
