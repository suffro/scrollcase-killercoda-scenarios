#!/usr/bin/env bash

set -Eeuo pipefail
{ set +x; } 2>/dev/null

cd /root/demo

clear
echo
echo "########################################################################"
echo "#####  Locking the example environment for a reproducible build  #####"
echo
echo '$ scrollcase lock example-box/linux-x86_64-cpu'
echo

scrollcase lock example-box/linux-x86_64-cpu

echo
echo "########################################################################"
echo "#####  Committing the generated project and lock  #####"
echo
echo '$ git add .'
echo '$ git commit -m "Initialize Scrollcase example"'
echo

git add .
git commit -m "Initialize Scrollcase example"
