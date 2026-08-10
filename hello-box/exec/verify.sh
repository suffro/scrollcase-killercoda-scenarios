#!/usr/bin/env bash

cd ~/demo

clear
printf '\nVerifying the signed release and box archive.\n\n'
printf '$ scrollcase verify box/*.release.json --public-key keys/example-signing-public.json\n\n'

scrollcase verify box/*.release.json \
  --public-key keys/example-signing-public.json
