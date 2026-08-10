#!/usr/bin/env bash

set -Eeuo pipefail

READY="/tmp/scrollcase-demo-ready"
FAILED="/tmp/scrollcase-demo-failed"
LOG="/tmp/scrollcase-run-demo.log"

if true; then
  clear
  : > "$LOG"

  show_title() {
    local title="$1"
    echo
    echo
    echo
    echo "##############${title//?/#}"
    echo "#####  $title  #####"
    echo
  }

  show_title "Preparing the Scrollcase demo environment" | tee -a "$LOG"

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

  if [[ "$status" == "ready" ]]; then
    show_title "Scrollcase demo environment ready" | tee -a "$LOG"
  else
    show_title "Scrollcase demo environment setup failed" | tee -a "$LOG"
  fi

  [[ "$status" == "ready" ]]
fi
