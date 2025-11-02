"""Main application entry point."""

import sys
from pathlib import Path

from your_package import setup_logger, get_logger
from your_package.config import settings

# Initialize logger
logger = get_logger(__name__)


def initialize() -> None:
    """Initialize the application."""
    # Setup logging first
    setup_logger()

    logger.info("=" * 60)
    logger.info(f"Starting {settings.app_name}")
    logger.info(f"Python Version: {sys.version}")
    logger.info(f"Debug Mode: {settings.debug}")
    logger.info(f"Log Level: {settings.log_level}")
    logger.info("=" * 60)


def main() -> int:
    """
    Main application function.

    Returns:
        int: Exit code (0 for success, non-zero for failure)
    """
    try:
        initialize()

        # Your application logic here
        logger.info("Running main application logic...")

        # Example: Your business logic
        result = run_application()

        logger.success(f"Application completed successfully: {result}")
        return 0

    except KeyboardInterrupt:
        logger.warning("Application interrupted by user")
        return 130

    except Exception as e:
        logger.exception(f"Application failed with error: {e}")
        return 1

    finally:
        logger.info("Application shutdown complete")


def run_application() -> str:
    """
    Core application logic.

    Returns:
        str: Result message
    """
    logger.info("Executing application logic...")

    # Example: Add your actual application code here
    logger.debug("Processing step 1...")
    logger.debug("Processing step 2...")
    logger.debug("Processing step 3...")

    return "All operations completed"


if __name__ == "__main__":
    sys.exit(main())
