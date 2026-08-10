#!/usr/bin/env bash

set -Eeuo pipefail

READY="/tmp/scrollcase-build-demo-ready"
FAILED="/tmp/scrollcase-build-demo-failed"
DEMO_DIR="/root/demo"

NODE_VERSION="v22.23.2"
NODE_ARCHIVE="node-${NODE_VERSION}-linux-x64.tar.xz"
NODE_BASE_URL="https://nodejs.org/download/release/${NODE_VERSION}"

rm -f "$READY" "$FAILED"

on_error() {
  touch "$FAILED"
}

trap on_error ERR

if [[ "$(uname -m)" != "x86_64" ]]; then
  echo "This demo requires an x86_64 Killercoda environment." >&2
  exit 1
fi

apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install -y \
  --no-install-recommends \
  ca-certificates \
  curl \
  git \
  xz-utils

rm -rf /var/lib/apt/lists/*

NEED_NODE=1

if command -v node >/dev/null 2>&1; then
  NODE_MAJOR="$(node -p 'process.versions.node.split(".")[0]')"

  if (( NODE_MAJOR >= 20 )); then
    NEED_NODE=0
  fi
fi

if (( NEED_NODE == 1 )); then
  TMP_NODE="$(mktemp --suffix=.tar.xz)"
  TMP_SUMS="$(mktemp)"

  curl \
    --fail \
    --location \
    --retry 3 \
    --silent \
    --show-error \
    "${NODE_BASE_URL}/${NODE_ARCHIVE}" \
    --output "$TMP_NODE"

  curl \
    --fail \
    --location \
    --retry 3 \
    --silent \
    --show-error \
    "${NODE_BASE_URL}/SHASUMS256.txt" \
    --output "$TMP_SUMS"

  EXPECTED="$(grep " ${NODE_ARCHIVE}$" "$TMP_SUMS" | awk '{print $1}')"
  ACTUAL="$(sha256sum "$TMP_NODE" | awk '{print $1}')"

  if [[ -z "$EXPECTED" || "$EXPECTED" != "$ACTUAL" ]]; then
    echo "Node.js archive checksum verification failed." >&2
    exit 1
  fi

  tar \
    -xJf "$TMP_NODE" \
    -C /usr/local \
    --strip-components=1

  rm -f "$TMP_NODE" "$TMP_SUMS"
fi

rm -rf "$DEMO_DIR"
mkdir -p "$DEMO_DIR"

git -C "$DEMO_DIR" init
git -C "$DEMO_DIR" config user.name "Scrollcase Demo"
git -C "$DEMO_DIR" config user.email "demo@scrollcase.dev"

touch "$READY"
