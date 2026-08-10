#!/usr/bin/env bash

set -Eeuo pipefail
{ set +x; } 2>/dev/null

cd /root/demo

clear
echo
echo "########################################################################"
echo "#####  Creating a local signing key for the demo  #####"
echo
echo '$ scrollcase keygen'
echo

scrollcase keygen

clear
echo
echo "########################################################################"
echo "#####  Building and signing the locked Linux CPU box  #####"
echo
echo '$ scrollcase build example-box/linux-x86_64-cpu --weights embed'
echo

scrollcase build example-box/linux-x86_64-cpu --weights embed
