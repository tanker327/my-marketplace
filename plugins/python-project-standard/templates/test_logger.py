"""Tests for logger configuration."""

import pytest
from pathlib import Path
from loguru import logger

from your_package.logger import setup_logger, get_logger, log_exception
from your_package.config import settings


def test_setup_logger(tmp_path, monkeypatch):
    """Test logger setup creates log directory and files."""
    # Use temporary directory for logs
    monkeypatch.setattr(settings, "log_dir", tmp_path / "logs")

    setup_logger()

    assert (tmp_path / "logs").exists()


def test_get_logger_with_name():
    """Test getting logger with name binding."""
    test_logger = get_logger("test_module")
    assert test_logger is not None


def test_get_logger_without_name():
    """Test getting logger without name binding."""
    test_logger = get_logger()
    assert test_logger is not None


def test_log_exception_decorator():
    """Test exception logging decorator."""

    @log_exception(ValueError)
    def failing_function():
        raise ValueError("Test error")

    with pytest.raises(ValueError, match="Test error"):
        failing_function()
