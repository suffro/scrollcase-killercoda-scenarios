#!/usr/bin/env bash

cd ~/demo

if true; then
  clear
  echo
  echo "########################################################################"
  echo "#####  Verifying the signed release and box archive  #####"
  echo
fi

scrollcase verify box/*.release.json --public-key keys/example-signing-public.json
