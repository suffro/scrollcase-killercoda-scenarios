#!/usr/bin/env bash

set -Eeuo pipefail

READY="/tmp/scrollcase-demo-ready"
FAILED="/tmp/scrollcase-demo-failed"

i=0
done=-1

while (( done<0 )); do
  if [[ -f "$READY" ]]; then
    printf "\r Preparing Scrollcase: ✓ Demo ready"
    echo
    echo
    done=0
  fi

  if [[ -f "$FAILED" ]]; then
    printf "\r Preparing Scrollcase: ✗ Demo setup failed"
    echo
    echo
    done=1
  fi
  
  if (( i == 0 )); then
    clear
    echo
    echo
  fi

  if (( done < 0 )); then
    dots=$((i % 4))

    printf "\r Preparing Scrollcase demo%-3s" "$(printf '%*s' "$dots" '' | tr ' ' '.')"

    i=$((i + 1))
  fi

  sleep 1
done

echo "."