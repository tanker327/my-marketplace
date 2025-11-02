"""Application configuration using Pydantic Settings."""

from pathlib import Path
from pydantic import Field
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Application settings loaded from environment variables."""

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        case_sensitive=False,
        extra="ignore",
    )

    # Application settings
    app_name: str = Field(default="My App", description="Application name")
    debug: bool = Field(default=False, description="Debug mode")

    # Database settings (example)
    database_url: str = Field(
        default="sqlite:///./app.db",
        description="Database connection URL",
    )

    # Logging settings
    log_level: str = Field(default="INFO", description="Logging level")
    log_dir: Path = Field(default=Path("logs"), description="Log directory")
    log_rotation: str = Field(default="10 MB", description="Log rotation size")
    log_retention: str = Field(default="1 month", description="Log retention period")
    log_format: str = Field(
        default="<green>{time:YYYY-MM-DD HH:mm:ss}</green> | <level>{level: <8}</level> | <cyan>{name}</cyan>:<cyan>{function}</cyan>:<cyan>{line}</cyan> - <level>{message}</level>",
        description="Log format string",
    )
    log_serialize: bool = Field(default=False, description="Serialize logs to JSON")


# Create a singleton instance
settings = Settings()
