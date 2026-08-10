#!/usr/bin/env bash

{ set +x; } 2>/dev/null

cd ~/demo

clear
echo
echo "########################################################################"
echo "#####  Verifying the signed release and box archive  #####"
echo
echo '$ scrollcase verify box/*.release.json --public-key keys/example-signing-public.json'
echo

scrollcase verify box/*.release.json \
  --public-key keys/example-signing-public.json
