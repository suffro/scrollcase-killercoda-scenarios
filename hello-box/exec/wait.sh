#!/usr/bin/env bash

set -Eeuo pipefail
{ set +x; } 2>/dev/null

READY="/tmp/scrollcase-demo-ready"
FAILED="/tmp/scrollcase-demo-failed"

clear
echo
echo "########################################################################"
echo "#####  Preparing the Scrollcase demo environment  #####"
echo

while true; do
  if [[ -f "$READY" ]]; then
    clear
    echo
    echo "########################################################################"
    echo "#####  Scrollcase demo environment ready  #####"
    echo
    exit 0
  fi

  if [[ -f "$FAILED" ]]; then
    clear
    echo
    echo "########################################################################"
    echo "#####  Scrollcase demo environment setup failed  #####"
    echo
    exit 1
  fi

  sleep 1
done
