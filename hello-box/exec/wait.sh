#!/usr/bin/env bash

set -Eeuo pipefail

READY="/tmp/scrollcase-demo-ready"
FAILED="/tmp/scrollcase-demo-failed"

i=0

while true; do
  if [[ -f "$READY" ]]; then
    printf "\r✓ Demo ready"
    exit 0
  fi

  if [[ -f "$FAILED" ]]; then
    printf "\r✗ Demo setup failed"
    exit 1
  fi
  
  if [[ i<=0 ]]; then
    printf " "
  fi

  dots=$((i % 4))

  printf "\rPreparing Scrollcase demo%-3s" "$(printf '%*s' "$dots" '' | tr ' ' '.')"

  i=$((i + 1))
  sleep 1
done