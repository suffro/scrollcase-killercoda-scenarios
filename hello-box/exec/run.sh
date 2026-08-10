#!/usr/bin/env bash

{ set +x; } 2>/dev/null

cd ~/demo

clear
echo
echo "########################################################################"
echo "#####  Verifying and running the box with its own Python  #####"
echo
echo '$ scrollcase run box/*.release.json --public-key keys/example-signing-public.json'
echo

scrollcase run box/*.release.json \
  --public-key keys/example-signing-public.json
