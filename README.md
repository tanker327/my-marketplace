# My Marketplace

A curated marketplace for storing and managing Claude Code plugins.

## Directory Structure

```
my-marketplace/
├── .claude-plugin/
│   └── marketplace.json     # Marketplace configuration
├── plugins/                 # Plugin storage
│   └── hello-demo/          # Example plugin
├── docs/                    # Documentation
├── scripts/                 # Management and utility scripts
└── tests/                   # Test files
```

## Getting Started

### Adding a Plugin

1. Create a new directory under `plugins/{plugin-name}`
2. Create the plugin structure:
   ```
   plugins/{plugin-name}/
   ├── .claude-plugin/
   │   └── plugin.json      # Plugin metadata
   ├── commands/            # Slash commands (optional)
   ├── agents/              # Custom agents (optional)
   └── README.md            # Documentation
   ```
3. Update `.claude-plugin/marketplace.json` to include the plugin

### Plugin Structure

Each plugin must have a `.claude-plugin/plugin.json` file:

```json
{
  "name": "my-plugin",
  "version": "1.0.0",
  "description": "Plugin description",
  "author": "Your Name",
  "license": "MIT"
}
```

Optional directories:
- `commands/` - Custom slash commands
- `agents/` - Custom agents
- `hooks/` - Event handlers

## Marketplace Configuration

The `.claude-plugin/marketplace.json` file defines available plugins:

```json
{
  "name": "my-marketplace",
  "owner": {
    "name": "Owner Name",
    "email": "owner@example.com"
  },
  "plugins": [
    {
      "name": "plugin-name",
      "source": "./plugins/plugin-name",
      "description": "Plugin description"
    }
  ]
}
```

## Contributing

Please ensure all plugins follow the proper structure and include documentation.
