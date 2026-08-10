#!/usr/bin/env bash

cd ~/demo

if true; then
  clear
  echo
  title="Verifying and running the box with its own Python"
  echo "##############${title//?/#}"
  echo "#####  $title  #####"
  echo
fi

scrollcase run box/*.release.json --public-key keys/example-signing-public.json
