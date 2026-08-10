#!/usr/bin/env bash

cd ~/demo

if true; then
    clear
fi

scrollcase verify box/*.release.json \
  --public-key keys/example-signing-public.json

if true; then
    clear
    printf " ✓ Verified"
fi
