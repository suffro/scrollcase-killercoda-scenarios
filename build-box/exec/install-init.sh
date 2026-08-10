#!/usr/bin/env bash

set -Eeuo pipefail

READY="/tmp/scrollcase-build-demo-ready"
FAILED="/tmp/scrollcase-build-demo-failed"
DEMO_DIR="/root/demo"

echo "Preparing the Linux demo environment..."

for _ in {1..600}; do
  if [[ -f "$FAILED" ]]; then
    echo "Demo environment setup failed." >&2
    exit 1
  fi

  if [[ -f "$READY" ]]; then
    break
  fi

  sleep 1
done

if [[ ! -f "$READY" ]]; then
  echo "Timed out while preparing the demo environment." >&2
  exit 1
fi

cd "$DEMO_DIR"

npm install \
  --global \
  --no-audit \
  --no-fund \
  scrollcase

scrollcase init --install-toolchain < /dev/null
