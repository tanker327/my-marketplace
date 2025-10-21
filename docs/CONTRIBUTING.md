# Contributing to My Marketplace

Thank you for your interest in contributing plugins to this marketplace!

## Adding a New Plugin

### 1. Choose the Right Category

Place your plugin in the appropriate category:
- `plugins/mcp-servers/` - MCP (Model Context Protocol) servers
- `plugins/utilities/` - Utility plugins
- `plugins/integrations/` - Third-party integrations
- `plugins/custom/` - Custom plugins

### 2. Create Plugin Directory

```bash
mkdir -p plugins/{category}/{plugin-name}
```

### 3. Create Plugin Manifest

Create a `plugin.json` file in your plugin directory with the required metadata:

```json
{
  "name": "my-plugin",
  "version": "1.0.0",
  "description": "What this plugin does",
  "author": "Your Name",
  "license": "MIT",
  "homepage": "https://example.com",
  "repository": "https://github.com/user/repo",
  "tags": ["tag1", "tag2"],
  "type": "mcp-server",
  "runtime": "node",
  "entrypoint": "index.js",
  "dependencies": {}
}
```

### 4. Include Documentation

Add a `README.md` file in your plugin directory with:
- Installation instructions
- Usage examples
- Configuration options
- Requirements

### 5. Update the Registry

Add your plugin entry to the main `registry.json` file:

```json
{
  "plugins": [
    {
      "name": "my-plugin",
      "path": "plugins/mcp-servers/my-plugin",
      "manifest": "plugins/mcp-servers/my-plugin/plugin.json"
    }
  ]
}
```

## Plugin Guidelines

1. **Documentation**: All plugins must include comprehensive documentation
2. **Versioning**: Use semantic versioning (MAJOR.MINOR.PATCH)
3. **License**: Clearly specify the license
4. **Dependencies**: List all dependencies explicitly
5. **Testing**: Include tests when applicable
6. **Security**: No hardcoded credentials or secrets

## File Structure

```
plugins/{category}/{plugin-name}/
├── plugin.json          # Required: Plugin manifest
├── README.md            # Required: Documentation
├── LICENSE              # Recommended: License file
├── src/                 # Source code
├── tests/               # Test files
└── examples/            # Usage examples
```

## Validation

Use the schema validator to check your plugin manifest:

```bash
# Validate against config/schema.json
# (validation script to be added)
```

## Questions?

Open an issue or reach out to the maintainers.
