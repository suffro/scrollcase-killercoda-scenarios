#!/usr/bin/env bash

set -Eeuo pipefail

cd /root/demo

clear
printf '\nCreating a local signing key for the demo.\n\n'
printf '$ scrollcase keygen\n\n'

scrollcase keygen

clear
printf '\nThe signing key is ready. Building and signing the locked Linux CPU box.\n\n'
printf '$ scrollcase build example-box/linux-x86_64-cpu --weights embed\n\n'

scrollcase build example-box/linux-x86_64-cpu --weights embed
