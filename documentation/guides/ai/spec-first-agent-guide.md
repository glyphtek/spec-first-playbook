# Spec-First Agent Guide

## Overview

This guide helps AI agents understand how to use the Spec First Playbook's tools and processes. It assumes you're already configured with a system prompt (either from [ai-first-playbook](https://github.com/glyphtek/ai-first-playbook) or your own).

## Documentation Structure

```
documentation/
├── base/           # Core project documentation
│   └── examples/   # Example implementations
├── generators/     # Documentation generators
├── evals/         # Evaluation tools
└── generated/     # Generated documentation
```

## Scale-Based Development

The Spec First Playbook uses a scale-based approach to ensure appropriate technology choices and architecture decisions:

### Scale Levels
1. **Minimal** (< 100 users, single team)
   - Basic features
   - Simple deployment
   - Monolithic architecture
   - Limited integrations

2. **Standard** (100-1000 users, multiple teams)
   - Full feature set
   - Team collaboration
   - Service-oriented
   - Common integrations

3. **Enterprise** (1000+ users, multiple organizations)
   - Advanced features
   - Organization management
   - Microservices
   - Custom integrations

4. **Serverless** (variable scale)
   - Serverless architecture
   - Pay-per-use
   - Auto-scaling
   - Cloud-native

### Scale Validation
When generating documentation, ensure:
1. PRD includes explicit scale level
2. Technology choices match scale
3. Architecture aligns with scale
4. Performance requirements are scale-appropriate
5. Security measures fit the scale
6. Monitoring matches scale needs

## Generator Usage Sequence

Always follow this sequence when generating documentation:

1. **Requirements Generation**
   ```
   documentation/generators/create_requirements_prompt.md
   ```
   Generates:
   - Use cases
   - Requirements matrices
   - Feature documentation
   - Scale-appropriate diagrams

2. **Technical Specifications**
   ```
   documentation/generators/create_technical_prompt.md
   ```
   Generates:
   - Architecture specs (scale-based)
   - Component designs
   - Security requirements
   - Scale-appropriate patterns

3. **Implementation Prompts**
   ```
   documentation/generators/create_prompts_prompt.md
   ```
   Generates:
   - Setup guides
   - Implementation steps
   - Testing requirements
   - Scale-specific implementations

## Evaluation Tools

Use these tools to validate your work:

1. **Generator Metadata Validation**
   ```
   documentation/evals/generator_metadata_schema.md
   ```
   Validates:
   - Generator configuration
   - Input/output mappings
   - Required sections

2. **Coverage Evaluation**
   ```
   documentation/evals/evaluate_coverage_prompt.md
   ```
   Checks:
   - Requirements coverage
   - Technical completeness
   - Implementation readiness

3. **Generator Evaluation**
   ```
   documentation/evals/generator_evaluation_prompt.md
   ```
   Verifies:
   - Generator output quality
   - Documentation consistency
   - Cross-references

## Example Workflow

1. **Start with Examples**
   - Review `/base/examples/todo-app-prd.md`
   - Note the scale level and tech choices
   - Study `/base/examples/todo-app-db-schema.md`
   - Understand the documentation style and depth

2. **Use Templates**
   - Copy from `/templates/`
   - Select appropriate scale level
   - Define technology constraints
   - Follow example structure
   - Maintain consistent formatting

3. **Generate Documentation**
   ```
   # 1. First validate metadata and scale requirements
   documentation/evals/generator_metadata_schema.md

   # 2. Generate requirements (scale-appropriate)
   documentation/generators/create_requirements_prompt.md

   # 3. Evaluate requirements coverage and scale alignment
   documentation/evals/evaluate_coverage_prompt.md

   # 4. Generate technical specs (scale-based)
   documentation/generators/create_technical_prompt.md

   # 5. Generate implementation prompts (scale-specific)
   documentation/generators/create_prompts_prompt.md

   # 6. Final coverage and scale evaluation
   documentation/evals/evaluate_coverage_prompt.md
   ```

## Best Practices

1. **Documentation First**
   - Always start with base documentation
   - Ensure scale level is defined
   - Use examples as reference
   - Follow template structure

2. **Scale Appropriateness**
   - Verify scale level matches requirements
   - Ensure tech choices fit scale
   - Use scale-appropriate patterns
   - Consider future scaling needs

3. **Validation**
   - Run evaluations after each generation
   - Check coverage before proceeding
   - Validate cross-references
   - Verify scale alignment

4. **Generation Order**
   - Follow the generator sequence
   - Don't skip evaluation steps
   - Update tracking files
   - Maintain scale consistency

## Common Questions

1. **Q: Where do I start with a new project?**
   A: Begin by determining the appropriate scale level, then review the examples in `/base/examples/` and use templates from `/templates/` to create your base documentation.

2. **Q: When should I run evaluations?**
   A: After each generation step and before proceeding to the next generator. Always verify scale appropriateness.

3. **Q: What if I find gaps in documentation?**
   A: Stop and help the developer complete the documentation before proceeding with generation.

4. **Q: Can the scale level change?**
   A: Yes, the PRD can be updated with a new scale level, but this requires regenerating technical specs and implementation prompts to match the new scale.

5. **Q: How do I handle scale-specific features?**
   A: Follow the patterns defined in the technical prompt for the chosen scale level, and ensure all generated documentation aligns with that scale.

## Remember

- Follow the generator sequence
- Use evaluation tools consistently
- Reference examples for guidance
- Keep documentation synchronized
- Maintain scale appropriateness
- Verify technology constraints
- Consider future scaling needs 