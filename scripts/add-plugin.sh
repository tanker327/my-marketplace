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
read -p "Category (mcp-servers/utilities/integrations/custom): " CATEGORY
read -p "Description: " DESCRIPTION
read -p "Author: " AUTHOR
read -p "License (default: MIT): " LICENSE
LICENSE=${LICENSE:-MIT}

# Create plugin directory
PLUGIN_DIR="plugins/${CATEGORY}/${PLUGIN_NAME}"
mkdir -p "${PLUGIN_DIR}"

echo -e "\n${YELLOW}Creating plugin structure...${NC}"

# Create plugin.json
cat > "${PLUGIN_DIR}/plugin.json" << EOF
{
  "name": "${PLUGIN_NAME}",
  "version": "1.0.0",
  "description": "${DESCRIPTION}",
  "author": "${AUTHOR}",
  "license": "${LICENSE}",
  "type": "${CATEGORY}",
  "tags": [],
  "entrypoint": "index.js",
  "dependencies": {}
}
EOF

# Create README.md
cat > "${PLUGIN_DIR}/README.md" << EOF
# ${PLUGIN_NAME}

${DESCRIPTION}

## Installation

\`\`\`bash
# Add installation instructions
\`\`\`

## Usage

\`\`\`bash
# Add usage examples
\`\`\`

## Configuration

Describe configuration options here.

## License

${LICENSE}
EOF

# Create basic directory structure
mkdir -p "${PLUGIN_DIR}/src"
mkdir -p "${PLUGIN_DIR}/tests"

echo -e "${GREEN}✓ Plugin structure created at: ${PLUGIN_DIR}${NC}"
echo -e "${YELLOW}Next steps:${NC}"
echo "1. Add your plugin code to ${PLUGIN_DIR}/src/"
echo "2. Update ${PLUGIN_DIR}/plugin.json with additional metadata"
echo "3. Complete the README documentation"
echo "4. Add entry to registry.json"
