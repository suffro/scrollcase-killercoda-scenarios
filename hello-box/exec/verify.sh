#!/usr/bin/env bash

cd ~/demo

if true; then
  clear
  echo
  title="Verifying the signed release and box archive"
  echo "##############${title//?/#}"
  echo "#####  $title  #####"
  echo
fi

scrollcase verify box/*.release.json --public-key keys/example-signing-public.json
