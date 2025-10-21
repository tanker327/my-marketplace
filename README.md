# My Marketplace

A curated marketplace for storing and managing plugins/MCP servers.

## Directory Structure

```
my-marketplace/
├── plugins/              # Plugin storage (organized by category or vendor)
├── docs/                 # Documentation
├── scripts/              # Management and utility scripts
├── tests/                # Test files
├── config/               # Configuration files
├── data/                 # Data files (catalogs, metadata)
├── registry.json         # Main registry catalog
└── README.md            # This file
```

## Getting Started

### Adding a Plugin

1. Create a new directory under `plugins/` for your plugin
2. Include a `plugin.json` manifest file with plugin metadata
3. Update the `registry.json` catalog

### Plugin Metadata Format

Each plugin should include a `plugin.json` file with the following structure:

```json
{
  "name": "plugin-name",
  "version": "1.0.0",
  "description": "Plugin description",
  "author": "Author name",
  "license": "MIT",
  "homepage": "https://example.com",
  "repository": "https://github.com/user/repo",
  "tags": ["tag1", "tag2"],
  "type": "mcp-server",
  "entrypoint": "index.js",
  "dependencies": {}
}
```

## Categories

Plugins are organized into the following categories:
- `mcp-servers/` - MCP (Model Context Protocol) servers
- `utilities/` - Utility plugins
- `integrations/` - Third-party integrations
- `custom/` - Custom plugins

## Contributing

Please ensure all plugins include proper documentation and follow the metadata format.
