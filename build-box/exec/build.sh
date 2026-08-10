#!/usr/bin/env bash

set -Eeuo pipefail

LOG="/tmp/scrollcase-build-demo.log"

cd /root/demo

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
    show_title "Creating a local signing key for the demo"
    echo '$ scrollcase keygen'
    echo
  } | tee -a "$LOG"

  scrollcase keygen 2>&1 | tee -a "$LOG"

  {
    show_title "Building and signing the locked Linux CPU box"
    echo '$ scrollcase build example-box/linux-x86_64-cpu --weights embed'
    echo
  } | tee -a "$LOG"

  scrollcase build example-box/linux-x86_64-cpu --weights embed 2>&1 | tee -a "$LOG"
fi
