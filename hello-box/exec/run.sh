#!/usr/bin/env bash

set -Eeuo pipefail

LOG="/tmp/scrollcase-run-demo.log"

cd ~/demo

if true; then
  clear
  [[ ! -f "$LOG" ]] || cat "$LOG"

  show_title() {
    local title="$1"
    echo
    echo
    echo
    echo "##############${title//?/#}"
    echo "#####  $title  #####"
    echo
  }

  {
    show_title "Verifying and running the box with its own Python"
    echo '$ scrollcase run box/*.release.json --public-key keys/example-signing-public.json'
    echo
  } | tee -a "$LOG"

  scrollcase run box/*.release.json --public-key keys/example-signing-public.json 2>&1 | tee -a "$LOG"
fi
