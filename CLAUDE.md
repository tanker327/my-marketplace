# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a plugin marketplace for storing and managing MCP (Model Context Protocol) servers and other plugins in a structured, discoverable format.

## Quick Commands

### Adding a Plugin
```bash
# Interactive plugin creation
./scripts/add-plugin.sh

# Manual creation
mkdir -p plugins/{category}/{plugin-name}
# Create plugin.json and README.md following schema in config/schema.json
```

## Architecture

### Plugin Categories
- `plugins/mcp-servers/` - MCP (Model Context Protocol) servers
- `plugins/utilities/` - Utility plugins
- `plugins/integrations/` - Third-party integrations
- `plugins/custom/` - Custom or specialized plugins

### Core Components

**Registry System**: `registry.json` serves as the central catalog listing all plugins with their paths and manifests. When adding plugins, always update this file.

**Plugin Structure**: Each plugin requires:
1. `plugin.json` - Metadata manifest (validated against `config/schema.json`)
2. `README.md` - Documentation
3. `src/` - Source code
4. `tests/` - Test files (optional)

**Schema Validation**: `config/schema.json` defines the JSON schema for plugin manifests. Required fields:
- `name` (kebab-case, matching pattern `^[a-z0-9-]+$`)
- `version` (semantic version, e.g., `1.0.0`)
- `description`
- `type` (one of: `mcp-server`, `utility`, `integration`, `custom`)

### Design Principles

1. **Categorization**: Plugins are organized by type for discoverability
2. **Validation**: All plugin.json files must conform to the schema
3. **Documentation**: Every plugin must have comprehensive README.md
4. **Registry Updates**: registry.json must be updated when adding/removing plugins

## Key Files

- `registry.json` - Main plugin catalog (update when adding plugins)
- `config/schema.json` - Plugin manifest schema (reference for validation)
- `docs/CONTRIBUTING.md` - Full plugin contribution guidelines
- `docs/ARCHITECTURE.md` - Detailed architecture documentation

## Adding Plugins

When adding a new plugin:
1. Choose appropriate category based on plugin type
2. Create directory structure: `plugins/{category}/{plugin-name}/`
3. Create `plugin.json` following `config/schema.json` requirements
4. Add `README.md` with installation, usage, and configuration
5. Update `registry.json` with new plugin entry:
   ```json
   {
     "name": "plugin-name",
     "path": "plugins/{category}/{plugin-name}",
     "manifest": "plugins/{category}/{plugin-name}/plugin.json"
   }
   ```

## Documentation Location

All documentation must be added to the `docs/` folder (per user requirements).
