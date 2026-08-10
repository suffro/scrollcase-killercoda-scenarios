#!/usr/bin/env bash

cd ~/demo

if true; then
    clear
    echo
    printf "\r Running..."
    echo
fi

scrollcase run box/*.release.json \
  --public-key keys/example-signing-public.json


if true; then
    printf "\r Running: ✓ done"
fi