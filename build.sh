#!/usr/bin/env bash
set -euo pipefail

image=guillon/dev-qemu-dev

dir="$(dirname "$0")"
docker build -t "$image" \
    ${http_proxy:+--build-arg http_proxy} \
    ${https_proxy:+--build-arg https_proxy} \
    ${no_proxy:+--build-arg no_proxy} \
    "$dir"
