#!/usr/bin/env bash

cd ~/demo

clear
printf '\nVerifying and running the box with its own Python.\n\n'
printf '$ scrollcase run box/*.release.json --public-key keys/example-signing-public.json\n\n'

scrollcase run box/*.release.json \
  --public-key keys/example-signing-public.json
