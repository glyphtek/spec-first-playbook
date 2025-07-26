#!/bin/bash

echo "Initializing agent-first project structure..."

# Create project structure
mkdir -p documentation/{base,generators,evals,generated,guides,templates}
mkdir -p documentation/guides/{developer,ai}
mkdir -p documentation/generated/{requirements,technical,prompts}

# Copy templates
cp documentation/templates/prd.template.md documentation/base/prd.md
cp documentation/templates/db_schema.template.md documentation/base/db_schema.md

# Copy guides
cp documentation/guides/ai/agent_guide.md documentation/guides/ai/
cp documentation/guides/developer/getting_started.md documentation/guides/developer/
cp documentation/guides/developer/starter_guide.md documentation/guides/developer/
cp documentation/guides/developer/contributing.md documentation/guides/developer/

# Copy evaluation tools
cp documentation/evals/* documentation/evals/

# Copy generators
cp documentation/generators/* documentation/generators/

# Create .gitignore
echo "documentation/generated/" > .gitignore
echo "*.tmp" >> .gitignore
echo "*.temp" >> .gitignore
echo ".DS_Store" >> .gitignore

# Create initial README.md
cat > README.md << 'EOL'
# Project Name

This project follows the agent-first development methodology from [Spec First Playbook](https://github.com/glyphtek/spec-first-playbook).

## Getting Started

1. **For Developers**
   - Read [Starter Guide](documentation/guides/developer/starter_guide.md) for setup and workflow
   - Read [Getting Started](documentation/guides/developer/getting_started.md) for detailed process
   - Review [Contributing Guidelines](documentation/guides/developer/contributing.md)
   - Set up your AI agent with our system prompt
   - Follow agent-first development practices

2. **For AI Agents**
   - Read [Agent Guide](documentation/guides/ai/agent_guide.md)
   - Follow the Confirmation Protocol
   - Validate all changes

## Project Documentation

- [Product Requirements (PRD)](documentation/base/prd.md)
- [Database Schema](documentation/base/db_schema.md)
- [Technical Specifications](documentation/generated/technical/)
- [Implementation Guides](documentation/generated/prompts/)

## Development Process

We use AI agents for development. For all changes:
1. Update documentation first
2. Let AI agents validate changes
3. Follow the Confirmation Protocol
4. Keep documentation in sync

For detailed workflow, see [Starter Guide](documentation/guides/developer/starter_guide.md).
EOL

echo "✅ Project initialized! Next steps:"
echo "1. Read documentation/guides/developer/starter_guide.md for detailed setup instructions"
echo "2. Set up your AI agent with the system prompt"
echo "3. Ask your agent to help create the initial PRD"
echo "4. Follow the agent-first development process" 