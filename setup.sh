#!/usr/bin/env bash

set -Eeuo pipefail

READY="/tmp/scrollcase-demo-ready"
FAILED="/tmp/scrollcase-demo-failed"

DEMO_DIR="/root/demo"

DEMO_TAG="demo-box-v1"
DEMO_ARCHIVE="hello-box-1.0.0-linux-x86_64-cpu.zip"

DEMO_URL="https://github.com/suffro/scrollcase/releases/download/${DEMO_TAG}/${DEMO_ARCHIVE}"

KEY_URL="https://raw.githubusercontent.com/suffro/scrollcase/${DEMO_TAG}/examples/keys/example-signing-public.json"

NODE_VERSION="v22.23.2"
NODE_ARCHIVE="node-${NODE_VERSION}-linux-x64.tar.xz"
NODE_BASE_URL="https://nodejs.org/download/release/${NODE_VERSION}"


# ---------------------------------------------------------------------------
# State
# ---------------------------------------------------------------------------

rm -f "$READY" "$FAILED"

on_error() {
  touch "$FAILED"
}

trap on_error ERR


# ---------------------------------------------------------------------------
# Architecture
#
# The published demo being used here is linux-x86_64-cpu.
# ---------------------------------------------------------------------------

if [[ "$(uname -m)" != "x86_64" ]]; then
  echo "This demo requires an x86_64 Killercoda environment." >&2
  exit 1
fi


# ---------------------------------------------------------------------------
# Basic tools
# ---------------------------------------------------------------------------

apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install -y \
  --no-install-recommends \
  ca-certificates \
  curl \
  unzip \
  xz-utils

rm -rf /var/lib/apt/lists/*


# ---------------------------------------------------------------------------
# Prepare demo directory
# ---------------------------------------------------------------------------

rm -rf "$DEMO_DIR"
mkdir -p "$DEMO_DIR/keys"


# ---------------------------------------------------------------------------
# Start downloading the large demo artifact immediately
# ---------------------------------------------------------------------------

TMP_DEMO="$(mktemp --suffix=.zip)"

curl \
  --fail \
  --location \
  --retry 3 \
  --silent \
  --show-error \
  "$DEMO_URL" \
  --output "$TMP_DEMO" &

DEMO_PID=$!


# ---------------------------------------------------------------------------
# Download the public key independently
# ---------------------------------------------------------------------------

curl \
  --fail \
  --location \
  --retry 3 \
  --silent \
  --show-error \
  "$KEY_URL" \
  --output "$DEMO_DIR/keys/example-signing-public.json" &

KEY_PID=$!


# ---------------------------------------------------------------------------
# Ensure Node >= 20 is available
# ---------------------------------------------------------------------------

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

  EXPECTED="$(
    grep " ${NODE_ARCHIVE}$" "$TMP_SUMS" |
    awk '{print $1}'
  )"

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


# ---------------------------------------------------------------------------
# Install Scrollcase
# ---------------------------------------------------------------------------

npm install \
  --global \
  --no-audit \
  --no-fund \
  scrollcase


# ---------------------------------------------------------------------------
# Finish parallel downloads
# ---------------------------------------------------------------------------

wait "$DEMO_PID"
wait "$KEY_PID"


# ---------------------------------------------------------------------------
# Extract the SAME wrapper archive used by the website demo
# ---------------------------------------------------------------------------

unzip \
  -q \
  "$TMP_DEMO" \
  -d "$DEMO_DIR"

rm -f "$TMP_DEMO"


# ---------------------------------------------------------------------------
# Sanity checks
# ---------------------------------------------------------------------------

if ! compgen -G "$DEMO_DIR/box/*.release.json" >/dev/null; then
  echo "No Scrollcase release document found." >&2
  exit 1
fi

if ! compgen -G "$DEMO_DIR/box/*.zip" >/dev/null; then
  echo "No Scrollcase box archive found." >&2
  exit 1
fi

if [[ ! -s "$DEMO_DIR/keys/example-signing-public.json" ]]; then
  echo "Demo public key is missing." >&2
  exit 1
fi

if ! command -v scrollcase >/dev/null 2>&1; then
  echo "Scrollcase CLI installation failed." >&2
  exit 1
fi


# ---------------------------------------------------------------------------
# Ready
# ---------------------------------------------------------------------------

touch "$READY"