#!/usr/bin/env bash

cd /root/demo

clear

scrollcase verify box/*.release.json \
  --public-key keys/example-signing-public.json