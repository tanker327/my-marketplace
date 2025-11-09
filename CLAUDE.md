# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a Claude Code plugin marketplace for storing and managing plugins (commands, agents, hooks, etc.) in a structured, discoverable format following the official Claude Code plugin marketplace specification.

## Quick Commands

### Adding a Plugin
```bash
# Interactive plugin creation (recommended)
./scripts/add-plugin.sh

# Manual plugin directory creation
mkdir -p plugins/{plugin-name}/.claude-plugin
mkdir -p plugins/{plugin-name}/commands  # optional
mkdir -p plugins/{plugin-name}/agents    # optional
mkdir -p plugins/{plugin-name}/hooks     # optional
```

### Validation
```bash
# List all plugins
ls -1 plugins/

# View all plugin manifests
find plugins -name "plugin.json" -exec cat {} \;

# Check marketplace catalog
cat .claude-plugin/marketplace.json

# Verify plugin structure
find plugins/{plugin-name} -type f
```

### Viewing Examples
```bash
# View example plugins
cat plugins/hello-demo/.claude-plugin/plugin.json
cat plugins/react-stack-standard/.claude-plugin/plugin.json
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

Optional fields: `author`, `license`, `homepage`, `repository`

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

Use `./scripts/add-plugin.sh` for interactive scaffolding, then complete these steps:

1. **Create plugin structure**: `plugins/{plugin-name}/`
2. **Create plugin manifest**: `.claude-plugin/plugin.json` with required fields:
   ```json
   {
     "name": "plugin-name",
     "version": "1.0.0",
     "description": "Brief description",
     "author": {
       "name": "Author Name",
       "email": "email@example.com"
     },
     "license": "MIT"
   }
   ```
3. **Add functionality** (optional):
   - `commands/*.md` - Slash commands
   - `agents/*.md` - Custom agents
   - `hooks/hooks.json` - Event handlers
4. **Create documentation**: `README.md` with installation, usage, and configuration
5. **CRITICAL - Register in marketplace**: Add entry to `.claude-plugin/marketplace.json`:
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

**Note**: Plugins must be registered in BOTH `plugins/{plugin-name}/.claude-plugin/plugin.json` AND `.claude-plugin/marketplace.json` (root). The marketplace.json entry makes the plugin discoverable.

## Critical Workflow Rules

1. **Dual Registration Required**: Every plugin needs TWO registrations:
   - Plugin manifest: `plugins/{plugin-name}/.claude-plugin/plugin.json`
   - Marketplace catalog: `.claude-plugin/marketplace.json` (root level)
   Missing either registration will cause the plugin to not work or not be discoverable.

2. **Always update marketplace.json**: When adding/modifying/removing plugins, `.claude-plugin/marketplace.json` MUST be updated

3. **Naming consistency**: Plugin name must be identical in:
   - Directory name: `plugins/{plugin-name}/`
   - Plugin manifest `name` field
   - Marketplace `name` field

4. **Use add-plugin.sh for scaffolding**: The script creates the correct structure but you must still manually update marketplace.json afterward

5. **Documentation location**: General docs go in `docs/`, plugin-specific docs in plugin `README.md`

6. **Required manifest fields**: At minimum, plugin.json must have: `name`, `version`, `description`

7. **Reference existing plugins**: Use `hello-demo` and `react-stack-standard` as templates for structure
