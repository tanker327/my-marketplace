"""Tests for configuration module."""

import pytest
from your_package.config import settings


def test_settings_app_name():
    """Test that app_name setting is loaded."""
    assert settings.app_name is not None
    assert isinstance(settings.app_name, str)


def test_settings_debug():
    """Test that debug setting is a boolean."""
    assert isinstance(settings.debug, bool)


def test_settings_log_level():
    """Test that log_level setting is loaded."""
    assert settings.log_level is not None
    assert isinstance(settings.log_level, str)
    assert settings.log_level in [
        "TRACE",
        "DEBUG",
        "INFO",
        "WARNING",
        "ERROR",
        "CRITICAL",
    ]


def test_settings_database_url():
    """Test that database_url setting is loaded."""
    assert settings.database_url is not None
    assert isinstance(settings.database_url, str)
