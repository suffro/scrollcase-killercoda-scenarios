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
    echo "##############${title//?/#}"
    echo "#####  $title  #####"
    echo
  }

  {
    show_title "Verifying the signed release and box archive"
    echo '$ scrollcase verify box/*.release.json --public-key keys/example-signing-public.json'
    echo
  } | tee -a "$LOG"

  scrollcase verify box/*.release.json --public-key keys/example-signing-public.json 2>&1 | tee -a "$LOG"
fi
