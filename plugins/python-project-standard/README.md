# Python Project Standard Plugin

A production-ready Python project template with modern tooling and best practices.

## Overview

This plugin provides a comprehensive Python project setup with:

- **UV** - Fast Python package manager
- **Pydantic Settings** - Type-safe configuration management
- **Loguru** - Simplified logging with rotation and retention
- **Pytest** - Testing framework with coverage
- **Ruff** - Fast linting and formatting (replaces Black + Flake8 + isort)
- **Pyright** - Static type checking
- **Pre-commit** - Git hooks for code quality
- **Bandit** - Security linting
- **GitHub Actions** - CI/CD pipeline
- **Makefile** - Development task runner

## Features

✨ **Modern Stack** - Uses the latest Python tooling and best practices
🚀 **Fast Setup** - One command to get a complete project structure
📦 **Dependency Management** - UV for fast and reliable package management
🔧 **Configuration** - Environment-based config with Pydantic
📝 **Logging** - Production-ready logging with Loguru
✅ **Testing** - Pytest with coverage reporting
🎨 **Code Quality** - Automated linting, formatting, and type checking
🔒 **Security** - Built-in security scanning
🔄 **CI/CD** - Ready-to-use GitHub Actions workflow
🐳 **Docker** - Optional Docker support

## Project Structure

```
your-project/
├── src/
│   └── your_package/
│       ├── __init__.py
│       ├── config.py          # Pydantic settings
│       ├── logger.py          # Loguru setup
│       └── main.py            # Application entry point
├── tests/
│   ├── __init__.py
│   ├── test_config.py
│   ├── test_logger.py
│   └── test_main.py
├── logs/                       # Application logs (gitignored)
├── .github/
│   └── workflows/
│       └── ci.yml             # CI/CD pipeline
├── .env                        # Environment variables (gitignored)
├── .env.example               # Example environment file
├── .gitignore
├── .editorconfig
├── .pre-commit-config.yaml
├── pyproject.toml             # Project configuration
├── Makefile                   # Development commands
├── run.sh                     # Application runner script
├── run-dev.sh                 # Development mode runner
├── run-prod.sh                # Production mode runner
├── Dockerfile                 # Docker configuration (optional)
├── README.md
└── uv.lock                    # Lock file (auto-generated)
```

## Usage

Simply ask Claude to create a Python project using this standard:

```
Create a new Python project called "my-awesome-app" using the python-project-standard
```

Claude will:
1. Create the complete project structure
2. Install all dependencies
3. Configure all tools
4. Set up pre-commit hooks
5. Create runner scripts
6. Provide usage instructions

## Available Make Commands

```bash
make help              # Show all available commands
make install           # Install production dependencies
make dev-install       # Install development dependencies
make test              # Run tests with coverage
make test-fast         # Run tests without coverage
make lint              # Run linter
make lint-fix          # Run linter with auto-fix
make format            # Format code
make format-check      # Check code formatting
make type-check        # Run type checker
make security          # Run security checks
make pre-commit-install  # Install pre-commit hooks
make pre-commit-run    # Run pre-commit on all files
make clean             # Clean up generated files
make all               # Run all checks
make run               # Run the application
make run-dev           # Run in development mode
make run-prod          # Run in production mode
```

## Runner Scripts

```bash
./run.sh              # Normal mode
./run-dev.sh          # Development mode (DEBUG logging)
./run-prod.sh         # Production mode
```

## Configuration

Environment variables are managed through `.env` file:

```bash
# Application
APP_NAME=My Application
DEBUG=false

# Database
DATABASE_URL=postgresql://user:pass@localhost/dbname

# Logging
LOG_LEVEL=INFO
LOG_DIR=logs
LOG_ROTATION=10 MB
LOG_RETENTION=1 month
LOG_SERIALIZE=false
```

## CI/CD

GitHub Actions workflow is included that:
- Tests on Python 3.11 and 3.12
- Runs linting and formatting checks
- Runs type checking
- Runs tests with coverage
- Uploads coverage to Codecov

## Best Practices Included

- Type hints for all functions
- Comprehensive logging
- Error handling with proper exit codes
- Configuration via environment variables
- Test coverage tracking (80% minimum)
- Security scanning
- Pre-commit hooks for quality checks
- Consistent code formatting
- Structured project layout

## Requirements

- Python 3.11+
- UV package manager

## License

MIT

## Author

Eric Wu (tanker327@gmail.com)
