#!/usr/bin/env bash

set -Eeuo pipefail

cd /root/demo

clear
printf '\nLocking the example environment for a reproducible build.\n\n'
printf '$ scrollcase lock example-box/linux-x86_64-cpu\n\n'

scrollcase lock example-box/linux-x86_64-cpu

printf '\nCommitting the generated project and lock.\n\n'
printf '$ git add .\n'
printf '$ git commit -m "Initialize Scrollcase example"\n\n'

git add .
git commit -m "Initialize Scrollcase example"
