#!/usr/bin/env bash

cd ~/demo

clear

printf "\r Verifing"

scrollcase verify box/*.release.json \
  --public-key keys/example-signing-public.json

printf "\r Verifing: done"
