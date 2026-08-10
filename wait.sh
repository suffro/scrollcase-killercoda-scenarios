#!/usr/bin/env bash

set -Eeuo pipefail

READY="/tmp/scrollcase-demo-ready"
FAILED="/tmp/scrollcase-demo-failed"

echo -n "Preparing Scrollcase demo"

while true; do
  if [[ -f "$READY" ]]; then
    echo
    echo "✓ Demo ready"
    echo
    exit 0
  fi

  if [[ -f "$FAILED" ]]; then
    echo
    echo "✗ Demo setup failed"
    exit 1
  fi

  echo -n "."
  sleep 1
done