# Quick Start Guide

Welcome to the Spec First Playbook! This guide will help you get started with spec-first development.

## Initial Setup

1. **Clone and Initialize**
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ./documentation/templates/init.sh
   ```

2. **Configure AI Agent**
   You have two options:
   - Use the [AI-First Playbook](https://github.com/glyphtek/ai-first-playbook) system prompt
   - Use your preferred system prompt

   Important: Share the README.md with your AI agent to provide context about:
   - Project structure
   - Available tools
   - Documentation workflow
   - Scale-based development

## Project Scale Levels

Choose the appropriate scale for your project:

1. **Minimal** (< 100 users)
   - Basic features
   - Simple deployment
   - Monolithic architecture
   - Limited integrations
   
2. **Standard** (100-1000 users)
   - Full feature set
   - Team collaboration
   - Service-oriented
   - Common integrations
   
3. **Enterprise** (1000+ users)
   - Advanced features
   - Organization management
   - Microservices
   - Custom integrations
   
4. **Serverless** (variable scale)
   - Serverless architecture
   - Pay-per-use
   - Auto-scaling
   - Cloud-native

## Starting a New Project

1. **Review Examples**
   Study our todo app example to understand the expected structure:
   - [Example PRD](../../base/examples/todo-app-prd.md) (note the scale level)
   - [Example DB Schema](../../base/examples/todo-app-db-schema.md)

2. **Create Base Documentation**
   Use our templates to create your core docs:
   - Copy from `/templates/prd.template.md`
   - Select appropriate scale level
   - Define technology constraints
   - Copy from `/templates/db_schema.template.md`
   - Follow the example structure

3. **Generate Documentation**
   Have your AI agent follow this sequence:
   ```bash
   # 1. Validate generator metadata and scale requirements
   documentation/evals/generator_metadata_schema.md

   # 2. Generate scale-appropriate requirements
   documentation/generators/create_requirements_prompt.md

   # 3. Check coverage and scale alignment
   documentation/evals/evaluate_coverage_prompt.md

   # 4. Generate scale-based technical specs
   documentation/generators/create_technical_prompt.md

   # 5. Generate scale-specific implementation prompts
   documentation/generators/create_prompts_prompt.md
   ```

## Development Workflow

1. **Documentation First**
   - Choose appropriate scale level
   - Define technology constraints
   - Always start with base documentation
   - Let AI help expand and validate
   - Use generators for consistency

2. **Scale Considerations**
   - Verify scale level matches needs
   - Ensure tech choices fit scale
   - Consider future scaling
   - Follow scale-appropriate patterns

3. **Iterative Development**
   - Update documentation as needed
   - Run evaluations to check coverage
   - Keep documentation synchronized
   - Maintain scale consistency

4. **Making Changes**
   - Update affected documentation
   - Let AI analyze impact
   - Regenerate affected docs
   - Verify scale alignment

5. **Evaluation**
   - Follow the [Evaluation Guide](./evaluation-guide.md)
   - Check coverage and quality
   - Validate scale alignment
   - Address any issues found

## Tips for Success

1. **Working with AI**
   - Share README.md for context
   - Reference example files
   - Follow the generator sequence
   - Specify scale requirements

2. **Documentation Quality**
   - Use templates consistently
   - Follow example structure
   - Run evaluations regularly
   - Maintain scale appropriateness

3. **Common Pitfalls**
   - Skipping documentation updates
   - Bypassing evaluation steps
   - Ignoring generator sequence
   - Mismatching scale and requirements
   - Over/under-engineering for scale

4. **Scale Management**
   - Start with appropriate scale
   - Document scaling triggers
   - Plan for scale transitions
   - Keep tech choices aligned

## Next Steps

- Review [Spec-First Workflow](./spec-first-workflow.md) for detailed process
- Check [Contributing Guidelines](../../CONTRIBUTING.md) for standards
- Start with a small feature to practice the workflow
- Understand [Scale Levels](../ai/spec-first-agent-guide.md#scale-levels) 