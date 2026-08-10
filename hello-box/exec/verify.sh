#!/usr/bin/env bash

cd ~/demo

scrollcase verify box/*.release.json \
  --public-key keys/example-signing-public.json
