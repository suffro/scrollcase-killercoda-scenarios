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
    echo "##############${title//?/#}"
    echo "#####  $title  #####"
    echo
  }

  {
    show_title "Locking the example environment for a reproducible build"
    echo '$ scrollcase lock example-box/linux-x86_64-cpu'
    echo
  } | tee -a "$LOG"

  scrollcase lock example-box/linux-x86_64-cpu 2>&1 | tee -a "$LOG"

  {
    show_title "Committing the generated project and lock"
    echo '$ git add .'
    echo '$ git commit -m "Initialize Scrollcase example"'
    echo
  } | tee -a "$LOG"

  git add .
  git commit -m "Initialize Scrollcase example" 2>&1 | tee -a "$LOG"
fi
