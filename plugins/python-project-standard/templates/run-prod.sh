#!/bin/bash

# run-prod.sh - Run in production mode
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Starting in PRODUCTION mode..."
export DEBUG=false
export LOG_LEVEL=INFO

./run.sh "$@"
