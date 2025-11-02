"""Centralized logging configuration using Loguru."""

import sys
from pathlib import Path
from loguru import logger

from .config import settings


def setup_logger() -> None:
    """
    Configure loguru logger with application settings.

    This function should be called once at application startup.
    """
    # Remove default handler
    logger.remove()

    # Create log directory if it doesn't exist
    settings.log_dir.mkdir(parents=True, exist_ok=True)

    # Console handler - always add this
    logger.add(
        sys.stdout,
        format=settings.log_format,
        level=settings.log_level,
        colorize=True,
        backtrace=True,
        diagnose=settings.debug,
    )

    # File handler - general logs
    logger.add(
        settings.log_dir / "app.log",
        format=settings.log_format,
        level=settings.log_level,
        rotation=settings.log_rotation,
        retention=settings.log_retention,
        compression="zip",
        backtrace=True,
        diagnose=settings.debug,
        serialize=settings.log_serialize,
    )

    # File handler - error logs only
    logger.add(
        settings.log_dir / "error.log",
        format=settings.log_format,
        level="ERROR",
        rotation=settings.log_rotation,
        retention=settings.log_retention,
        compression="zip",
        backtrace=True,
        diagnose=True,  # Always diagnose errors
        serialize=settings.log_serialize,
    )

    logger.info(f"Logger initialized - Level: {settings.log_level}")
    logger.debug(f"Debug mode: {settings.debug}")


def get_logger(name: str | None = None):
    """
    Get a logger instance with optional name binding.

    Args:
        name: Optional name to bind to the logger (e.g., module name)

    Returns:
        Logger instance

    Example:
        >>> from your_package.logger import get_logger
        >>> logger = get_logger(__name__)
        >>> logger.info("Hello world")
    """
    if name:
        return logger.bind(name=name)
    return logger


def log_exception(exception_type=Exception):
    """
    Decorator to log exceptions with full traceback.

    Args:
        exception_type: Type of exception to catch (default: Exception)

    Example:
        >>> @log_exception(ValueError)
        >>> def risky_function():
        >>>     raise ValueError("Something went wrong")
    """

    def decorator(func):
        def wrapper(*args, **kwargs):
            try:
                return func(*args, **kwargs)
            except exception_type:
                logger.exception(f"Exception in {func.__name__}")
                raise

        return wrapper

    return decorator
