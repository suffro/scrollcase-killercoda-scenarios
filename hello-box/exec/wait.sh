#!/usr/bin/env bash

set -Eeuo pipefail

READY="/tmp/scrollcase-demo-ready"
FAILED="/tmp/scrollcase-demo-failed"

if true; then
  clear
  echo
  title="Preparing the Scrollcase demo environment"
  echo "##############${title//?/#}"
  echo "#####  $title  #####"
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
  if [[ "$status" == "ready" ]]; then
    title="Scrollcase demo environment ready"
  else
    title="Scrollcase demo environment setup failed"
  fi
  echo "##############${title//?/#}"
  echo "#####  $title  #####"
  echo

  [[ "$status" == "ready" ]]
fi
