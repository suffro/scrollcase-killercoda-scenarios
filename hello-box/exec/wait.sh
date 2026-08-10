#!/usr/bin/env bash

set -Eeuo pipefail

READY="/tmp/scrollcase-demo-ready"
FAILED="/tmp/scrollcase-demo-failed"

if true; then
  clear
  echo
  echo "########################################################################"
  echo "#####  Preparing the Scrollcase demo environment  #####"
  echo

  status="waiting"
  while [[ "$status" == "waiting" ]]; do
    if [[ -f "$READY" ]]; then
      status="ready"
    elif [[ -f "$FAILED" ]]; then
      status="failed"
    else
      sleep 1
    fi
  done

  clear
  echo
  echo "########################################################################"
  if [[ "$status" == "ready" ]]; then
    echo "#####  Scrollcase demo environment ready  #####"
  else
    echo "#####  Scrollcase demo environment setup failed  #####"
  fi
  echo

  [[ "$status" == "ready" ]]
fi
