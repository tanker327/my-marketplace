# My Marketplace

A curated marketplace for storing and managing Claude Code plugins following the official Claude Code plugin marketplace specification.

## Overview

This repository serves as a centralized marketplace for Claude Code plugins, providing a structured and discoverable format for commands, agents, hooks, and other extensions. Each plugin is self-contained with its own metadata, documentation, and functionality.

## Available Plugins

### 🎉 hello-demo
A demo plugin that provides hello world commands, agents, and hooks to help you understand plugin structure and functionality.

**Features:**
- Custom slash command `/hello-demo:hello`
- Example agent implementation
- Hook examples

**[View Plugin →](./plugins/hello-demo/)**

### ⚛️ react-stack-standard
A comprehensive starting point for new React projects with a modern, production-ready tech stack.

**Features:**
- TypeScript + Vite for fast development
- TailwindCSS + shadcn/ui for styling
- React Query for data fetching
- Zedux for state management
- Vitest for testing
- Docker multi-stage build for deployment
- Custom agent: `/react-stack-standard:react-setup`

**[View Plugin →](./plugins/react-stack-standard/)**

## Directory Structure

```
my-marketplace/
├── .claude-plugin/
│   └── marketplace.json     # Marketplace catalog (all plugins listed here)
├── plugins/                 # Plugin storage
│   ├── hello-demo/          # Demo plugin
│   └── react-stack-standard/ # React project starter
├── docs/                    # Documentation
│   ├── ARCHITECTURE.md      # Detailed architecture docs
│   └── CONTRIBUTING.md      # Plugin contribution guidelines
├── scripts/                 # Management and utility scripts
│   └── add-plugin.sh        # Interactive plugin scaffolding
└── tests/                   # Test files
```

## Quick Start

### Using Plugins

To use plugins from this marketplace in your Claude Code environment, refer to the [Claude Code documentation](https://docs.claude.com/claude-code) for installing marketplace plugins.

### Adding a Plugin

**Option 1: Interactive Scaffolding (Recommended)**

```bash
./scripts/add-plugin.sh
```

This script will guide you through creating the plugin structure.

**Option 2: Manual Creation**

1. Create plugin directory structure:
   ```bash
   mkdir -p plugins/{plugin-name}/.claude-plugin
   mkdir -p plugins/{plugin-name}/commands  # optional
   mkdir -p plugins/{plugin-name}/agents    # optional
   mkdir -p plugins/{plugin-name}/hooks     # optional
   ```

2. Create plugin manifest at `plugins/{plugin-name}/.claude-plugin/plugin.json`:
   ```json
   {
     "name": "plugin-name",
     "version": "1.0.0",
     "description": "Brief description of your plugin",
     "author": {
       "name": "Your Name",
       "email": "your.email@example.com"
     },
     "license": "MIT",
     "tags": ["keyword1", "keyword2"]
   }
   ```

3. **CRITICAL**: Register in marketplace catalog at `.claude-plugin/marketplace.json`:
   ```json
   {
     "name": "plugin-name",
     "source": "./plugins/plugin-name",
     "description": "Brief description",
     "version": "1.0.0",
     "license": "MIT",
     "author": {
       "name": "Your Name",
       "email": "your.email@example.com"
     }
   }
   ```

4. Create plugin README at `plugins/{plugin-name}/README.md`

5. Add functionality (optional):
   - `commands/*.md` - Slash commands
   - `agents/*.md` - Custom agents
   - `hooks/hooks.json` - Event handlers

### Plugin Structure

Each plugin follows the official Claude Code plugin structure:

```
plugin-name/
├── .claude-plugin/
│   └── plugin.json         # Required: Plugin metadata
├── commands/               # Optional: Slash commands (*.md files)
├── agents/                 # Optional: Custom agents (*.md files)
├── hooks/                  # Optional: Event handlers (hooks.json)
└── README.md               # Required: Documentation
```

**Required Fields in plugin.json:**
- `name` (kebab-case)
- `version` (semantic versioning)
- `description`

**Recommended Fields:**
- `author` (name and email)
- `license`
- `homepage`
- `repository`
- `tags`

## Validation

```bash
# List all plugins
ls -1 plugins/

# View all plugin manifests
find plugins -name "plugin.json" -exec cat {} \;

# Check marketplace catalog
cat .claude-plugin/marketplace.json

# Verify specific plugin structure
find plugins/{plugin-name} -type f
```

## Important Notes

⚠️ **Dual Registration Required**: Every plugin needs TWO registrations:
1. Plugin manifest: `plugins/{plugin-name}/.claude-plugin/plugin.json`
2. Marketplace catalog: `.claude-plugin/marketplace.json` (root level)

Missing either registration will cause the plugin to not work or not be discoverable.

✅ **Naming Consistency**: Plugin name must be identical in:
- Directory name: `plugins/{plugin-name}/`
- Plugin manifest `name` field
- Marketplace catalog `name` field

## Documentation

- **[ARCHITECTURE.md](./docs/ARCHITECTURE.md)** - Detailed architecture and design decisions
- **[CONTRIBUTING.md](./docs/CONTRIBUTING.md)** - Full contribution guidelines
- **[CLAUDE.md](./CLAUDE.md)** - Claude Code integration instructions

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](./docs/CONTRIBUTING.md) for detailed guidelines on:
- Plugin structure requirements
- Documentation standards
- Testing requirements
- Submission process

## License

MIT

## Support

For issues or questions:
- Check the [docs/](./docs/) directory for detailed documentation
- Review existing plugins for examples
- Open an issue in this repository
