#!/bin/bash

# run-dev.sh - Run in development mode
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Starting in DEVELOPMENT mode..."
export DEBUG=true
export LOG_LEVEL=DEBUG

./run.sh "$@"
