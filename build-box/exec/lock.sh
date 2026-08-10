#!/usr/bin/env bash

set -Eeuo pipefail

cd /root/demo

scrollcase lock example-box/linux-x86_64-cpu

git add .
git commit -m "Initialize Scrollcase example"
