#!/bin/bash
# Script to add a new plugin to the marketplace

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Add New Plugin to Marketplace ===${NC}\n"

# Prompt for plugin details
read -p "Plugin name (kebab-case): " PLUGIN_NAME
read -p "Description: " DESCRIPTION
read -p "Author: " AUTHOR
read -p "License (default: MIT): " LICENSE
LICENSE=${LICENSE:-MIT}

# Create plugin directory
PLUGIN_DIR="plugins/${PLUGIN_NAME}"
mkdir -p "${PLUGIN_DIR}/.claude-plugin"
mkdir -p "${PLUGIN_DIR}/commands"
mkdir -p "${PLUGIN_DIR}/agents"

echo -e "\n${YELLOW}Creating plugin structure...${NC}"

# Create plugin.json
cat > "${PLUGIN_DIR}/.claude-plugin/plugin.json" << EOF
{
  "name": "${PLUGIN_NAME}",
  "version": "1.0.0",
  "description": "${DESCRIPTION}",
  "author": "${AUTHOR}",
  "license": "${LICENSE}"
}
EOF

# Create README.md
cat > "${PLUGIN_DIR}/README.md" << EOF
# ${PLUGIN_NAME}

${DESCRIPTION}

## Installation

Install this plugin from the marketplace or copy the plugin directory to your project.

## Usage

\`\`\`bash
# Add usage examples
\`\`\`

## Configuration

Describe configuration options here.

## License

${LICENSE}
EOF

echo -e "${GREEN}✓ Plugin structure created at: ${PLUGIN_DIR}${NC}"
echo -e "${YELLOW}Next steps:${NC}"
echo "1. Add commands to ${PLUGIN_DIR}/commands/ (optional)"
echo "2. Add agents to ${PLUGIN_DIR}/agents/ (optional)"
echo "3. Update ${PLUGIN_DIR}/.claude-plugin/plugin.json with additional metadata"
echo "4. Complete the README documentation"
echo "5. Add entry to .claude-plugin/marketplace.json"
