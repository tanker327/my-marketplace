#!/bin/bash

# run.sh - Run the application
# Usage: ./run.sh [options]

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Function to print colored messages
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if .env file exists
check_env_file() {
    if [ ! -f ".env" ]; then
        log_warn ".env file not found!"
        if [ -f ".env.example" ]; then
            log_info "Creating .env from .env.example..."
            cp .env.example .env
            log_warn "Please update .env file with your settings"
        else
            log_error ".env.example not found. Please create .env file manually."
            exit 1
        fi
    fi
}

# Function to check if UV is installed
check_uv() {
    if ! command -v uv &> /dev/null; then
        log_error "UV is not installed!"
        log_info "Install UV with: curl -LsSf https://astral.sh/uv/install.sh | sh"
        exit 1
    fi
}

# Function to sync dependencies
sync_dependencies() {
    log_info "Syncing dependencies..."
    uv sync
}

# Function to run the application
run_app() {
    log_info "Starting application..."
    echo ""
    uv run python -m src.your_package.main "$@"
}

# Main execution
main() {
    log_info "Running application from: $SCRIPT_DIR"

    # Pre-flight checks
    check_uv
    check_env_file

    # Check if dependencies need to be synced
    if [ ! -d ".venv" ] || [ ! -f "uv.lock" ]; then
        log_warn "Dependencies not installed or uv.lock missing"
        sync_dependencies
    fi

    # Run the application with all arguments passed to script
    run_app "$@"
}

# Run main function
main "$@"
