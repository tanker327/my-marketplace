# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a Claude Code plugin marketplace for storing and managing plugins (commands, agents, hooks, etc.) in a structured, discoverable format following the official Claude Code plugin marketplace specification.

## Quick Commands

### Adding a Plugin
```bash
# Interactive plugin creation
./scripts/add-plugin.sh

# Manual creation
mkdir -p plugins/{plugin-name}/.claude-plugin
# Create .claude-plugin/plugin.json and README.md
# Update .claude-plugin/marketplace.json
```

### Validation
```bash
# View all plugin files
find plugins -type f

# Check marketplace configuration
cat .claude-plugin/marketplace.json
```

## Architecture

### Marketplace Configuration

**Location**: `.claude-plugin/marketplace.json` (root of repository)

This is the central marketplace catalog that lists all available plugins. Required fields:
- `name` - Marketplace identifier
- `owner` - Owner name and email
- `plugins` - Array of plugin entries with `name`, `source`, and `description`

### Plugin Organization

Plugins are stored directly under `plugins/` directory (no categorization):
```
plugins/
├── hello-demo/
├── another-plugin/
└── my-plugin/
```

### Plugin Structure

Each plugin follows the official Claude Code plugin structure:

```
plugin-name/
├── .claude-plugin/
│   └── plugin.json      # Required: Plugin metadata
├── commands/            # Optional: Slash commands (*.md files)
├── agents/              # Optional: Custom agents (*.md files)
├── hooks/               # Optional: Event handlers (hooks.json)
└── README.md            # Required: Documentation
```

**Plugin Manifest** (`.claude-plugin/plugin.json`):
Required fields:
- `name` (kebab-case)
- `version` (semantic version)
- `description`

Optional fields: `author`, `license`, `homepage`, `repository`, `tags`

### Design Principles

1. **Standards Compliance**: Follows official Claude Code plugin marketplace specification
2. **Simplicity**: Flat plugin structure for easy navigation
3. **Documentation**: Every plugin must have comprehensive README.md
4. **Marketplace Updates**: `.claude-plugin/marketplace.json` must be updated when adding/removing plugins

## Key Files

- `.claude-plugin/marketplace.json` - Marketplace catalog (update when adding plugins)
- `plugins/{plugin-name}/.claude-plugin/plugin.json` - Individual plugin metadata
- `docs/CONTRIBUTING.md` - Full plugin contribution guidelines
- `docs/ARCHITECTURE.md` - Detailed architecture documentation

## Adding Plugins

When adding a new plugin:
1. Create directory: `plugins/{plugin-name}/`
2. Create `.claude-plugin/plugin.json` with required fields (name, version, description)
3. Add optional directories: `commands/`, `agents/`, `hooks/`
4. Add `README.md` with installation, usage, and configuration
5. **CRITICAL**: Update `.claude-plugin/marketplace.json` to register the plugin:
   ```json
   {
     "name": "plugin-name",
     "source": "./plugins/plugin-name",
     "description": "Brief description",
     "version": "1.0.0",
     "license": "MIT",
     "author": {
       "name": "Author Name",
       "email": "email@example.com"
     }
   }
   ```

## Critical Workflow Rules

1. **Always update marketplace.json**: When adding or modifying plugins, `.claude-plugin/marketplace.json` MUST be updated with the plugin entry
2. **Maintain structure consistency**: All plugin manifests must include name, version, and description at minimum
3. **Use add-plugin.sh for scaffolding**: The script creates the correct structure but you must still manually update marketplace.json
4. **Documentation location**: All general documentation goes in `docs/` folder, plugin-specific docs in plugin README.md
