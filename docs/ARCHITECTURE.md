# Marketplace Architecture

## Overview

This marketplace stores and manages Claude Code plugins following the official plugin marketplace specification.

## Directory Structure

### Root Level
```
.claude-plugin/
└── marketplace.json    # Marketplace configuration
```

The `marketplace.json` file defines:
- Marketplace name and owner
- List of available plugins with their sources

### `/plugins`
Main storage for all plugins. Each plugin has its own directory directly under `plugins/`.

### Plugin Structure
Each plugin follows the standard Claude Code plugin structure:

```
plugin-name/
├── .claude-plugin/
│   └── plugin.json      # Required: Plugin metadata
├── commands/            # Optional: Slash commands
│   └── command.md
├── agents/              # Optional: Custom agents
│   └── agent.md
├── hooks/               # Optional: Event handlers
│   └── hooks.json
└── README.md            # Required: Documentation
```

### `/docs`
Documentation for the marketplace itself:
- `CONTRIBUTING.md` - How to add plugins
- `ARCHITECTURE.md` - This file

### `/scripts`
Utility scripts for marketplace management:
- `add-plugin.sh` - Interactive plugin creation
- Future: validation, publishing, etc.

### `/tests`
Marketplace-level tests:
- Plugin validation
- Marketplace integrity checks

## Plugin Manifest

Each plugin must include a `.claude-plugin/plugin.json` file.

### Required Fields
- `name` - Unique identifier (kebab-case)
- `version` - Semantic version
- `description` - Brief description

### Optional Fields
- `author` - Creator information
- `license` - License identifier
- `homepage` - Project website
- `repository` - Source code URL
- `tags` - Discovery keywords

## Marketplace System

The `.claude-plugin/marketplace.json` file serves as the main catalog, listing all available plugins with their sources. This enables:
- Quick plugin discovery
- Version tracking
- Dependency resolution
- Automated tooling

## Design Principles

1. **Standards Compliance** - Follows official Claude Code plugin specification
2. **Simplicity** - Flat structure, easy to navigate
3. **Discoverability** - Clear metadata and documentation
4. **Extensibility** - Room to grow with additional features
5. **Documentation** - Every plugin is well-documented

## Future Enhancements

Potential additions:
- CLI tool for plugin management
- Automated validation and testing
- Version management system
- Dependency resolution
- Publishing workflow
- Web interface for browsing
