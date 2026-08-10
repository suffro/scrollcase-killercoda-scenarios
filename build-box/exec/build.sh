#!/usr/bin/env bash

set -Eeuo pipefail

cd /root/demo

scrollcase keygen
scrollcase build example-box/linux-x86_64-cpu --weights embed
