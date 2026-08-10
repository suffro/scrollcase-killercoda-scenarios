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
    show_title "Verifying the signed box and running its self-test"
    echo '$ scrollcase verify .scrollcase/dist/boxes/example-box/1.0.0/linux-x86_64-cpu/*.release.json --self-test'
    echo
  } | tee -a "$LOG"

  scrollcase verify .scrollcase/dist/boxes/example-box/1.0.0/linux-x86_64-cpu/*.release.json --self-test 2>&1 | tee -a "$LOG"
fi
