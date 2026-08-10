#!/usr/bin/env bash

cd ~/demo

if true; then
    clear
fi

printf "\r Running hello-box"

scrollcase run box/*.release.json \
  --public-key keys/example-signing-public.json

printf "\r Running hello-box: done"
