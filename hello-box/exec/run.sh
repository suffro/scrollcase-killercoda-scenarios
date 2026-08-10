#!/usr/bin/env bash

cd ~/demo

if true; then
    clear
    echo
    printf "\r Executing:"
    echo
fi

scrollcase run box/*.release.json \
  --public-key keys/example-signing-public.json