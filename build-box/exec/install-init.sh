#!/usr/bin/env bash

set -Eeuo pipefail

READY="/tmp/scrollcase-build-demo-ready"
FAILED="/tmp/scrollcase-build-demo-failed"
DEMO_DIR="/root/demo"
LOG="/tmp/scrollcase-build-demo.log"

if true; then
  clear
  : > "$LOG"

  show_title() {
    local title="$1"
    echo
    echo "##############${title//?/#}"
    echo "#####  $title  #####"
    echo
  }

  show_title "Preparing the Linux demo environment" | tee -a "$LOG"

  for _ in {1..600}; do
    if [[ -f "$FAILED" ]]; then
      echo "Demo environment setup failed." | tee -a "$LOG" >&2
      exit 1
    fi

    if [[ -f "$READY" ]]; then
      break
    fi

    sleep 1
  done

  if [[ ! -f "$READY" ]]; then
    echo "Timed out while preparing the demo environment." | tee -a "$LOG" >&2
    exit 1
  fi

  cd "$DEMO_DIR"

  {
    show_title "Installing the Scrollcase CLI"
    echo '$ npm install --global scrollcase'
    echo
  } | tee -a "$LOG"

  npm install --global --no-audit --no-fund scrollcase 2>&1 | tee -a "$LOG"

  {
    show_title "Initializing the example project and local build toolchain"
    echo '$ scrollcase init --install-toolchain'
    echo
  } | tee -a "$LOG"

  scrollcase init --install-toolchain < /dev/null 2>&1 | tee -a "$LOG"
fi
