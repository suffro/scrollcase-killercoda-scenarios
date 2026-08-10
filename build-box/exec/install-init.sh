#!/usr/bin/env bash

set -Eeuo pipefail

READY="/tmp/scrollcase-build-demo-ready"
FAILED="/tmp/scrollcase-build-demo-failed"
DEMO_DIR="/root/demo"

if true; then
  clear
  echo
  title="Preparing the Linux demo environment"
  echo "##############${title//?/#}"
  echo "#####  $title  #####"
  echo

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
fi

if true; then
  clear
  echo
  title="Installing the Scrollcase CLI"
  echo "##############${title//?/#}"
  echo "#####  $title  #####"
  echo
fi

npm install --global --no-audit --no-fund scrollcase

if true; then
  clear
  echo
  title="Initializing the example project and local build toolchain"
  echo "##############${title//?/#}"
  echo "#####  $title  #####"
  echo
fi

scrollcase init --install-toolchain < /dev/null
