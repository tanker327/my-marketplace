# Contributing to My Marketplace

Thank you for your interest in contributing plugins to this marketplace!

## Adding a New Plugin

### 1. Create Plugin Directory

```bash
mkdir -p plugins/{plugin-name}
```

### 2. Create Plugin Structure

Create the following structure:

```
plugins/{plugin-name}/
├── .claude-plugin/
│   └── plugin.json          # Required: Plugin manifest
├── commands/                 # Optional: Slash commands
├── agents/                   # Optional: Custom agents
├── hooks/                    # Optional: Event handlers
└── README.md                 # Required: Documentation
```

### 3. Create Plugin Manifest

Create `.claude-plugin/plugin.json` with the required metadata:

```json
{
  "name": "my-plugin",
  "version": "1.0.0",
  "description": "What this plugin does",
  "author": "Your Name",
  "license": "MIT"
}
```

### 4. Add Commands or Agents (Optional)

**For slash commands**, create markdown files in `commands/`:
```markdown
---
description: Command description
---

Command instructions here
```

**For agents**, create markdown files in `agents/`:
```markdown
---
description: Agent description
---

Agent instructions here
```

### 5. Include Documentation

Add a `README.md` file in your plugin directory with:
- Installation instructions
- Usage examples
- Configuration options
- Requirements

### 6. Update the Marketplace

Add your plugin entry to `.claude-plugin/marketplace.json`:

```json
{
  "plugins": [
    {
      "name": "my-plugin",
      "source": "./plugins/my-plugin",
      "description": "Brief description"
    }
  ]
}
```

## Plugin Guidelines

1. **Documentation**: All plugins must include comprehensive documentation
2. **Versioning**: Use semantic versioning (MAJOR.MINOR.PATCH)
3. **License**: Clearly specify the license
4. **Structure**: Follow the standard Claude Code plugin structure
5. **Testing**: Include tests when applicable
6. **Security**: No hardcoded credentials or secrets

## File Structure

```
plugins/{plugin-name}/
├── .claude-plugin/
│   └── plugin.json          # Required: Plugin metadata
├── commands/                 # Optional: Slash commands
│   └── mycommand.md
├── agents/                   # Optional: Custom agents
│   └── myagent.md
├── hooks/                    # Optional: Event handlers
│   └── hooks.json
├── README.md                 # Required: Documentation
└── LICENSE                   # Recommended: License file
```

## Questions?

Open an issue or reach out to the maintainers.
