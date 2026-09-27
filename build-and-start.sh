#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p Config Data
docker compose up -d --build
