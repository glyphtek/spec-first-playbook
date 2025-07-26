# Contributing Guidelines

## Documentation Standards

### File Naming Conventions
- Templates: `*.template.md`
- Generated files: `*.generated.md`
- Documentation: `*.md`
- Diagrams: `*.diagram.md`
- Generator prompts: `*_prompt.md`
- Evaluation prompts: `*_prompt.md`
- Schemas: `*_schema.md`

### Directory Structure
```
documentation/
├── base/                 # Core documentation
├── templates/            # Template files
├── guides/              # Documentation guides
│   ├── developer/      # Developer-specific guides
│   └── ai/            # AI agent-specific guides
├── generators/          # Generator prompts (*_prompt.md)
├── evals/              # Evaluation prompts and schemas (*_prompt.md, *_schema.md)
└── generated/          # Generated content (not in VCS)
```

### Version Control
1. **What to Version Control**
   - All template files
   - All generator files
   - All evaluation files
   - Configuration files
   - Documentation guides

2. **What NOT to Version Control**
   - Generated documentation
   - Temporary files
   - Local configuration
   - Personal notes

### Documentation Guidelines

1. **Templates**
   - Must include metadata section
   - Must follow standard structure
   - Must include example content
   - Must be clearly marked as templates

2. **Generators**
   - Must include complete metadata
   - Must specify input and output paths
   - Must include validation rules
   - Must handle errors gracefully

3. **Evaluation Files**
   - Must define clear success criteria
   - Must include validation steps
   - Must specify error conditions
   - Must provide remediation steps

### Pull Request Process

1. **Documentation Changes**
   - Update relevant templates
   - Update generator metadata
   - Update evaluation criteria
   - Test generation process

2. **Generator Changes**
   - Update metadata schema
   - Update evaluation rules
   - Test with example templates
   - Verify output structure

3. **Review Process**
   - Verify template validity
   - Check generator functionality
   - Validate evaluation rules
   - Test complete flow

## Development Workflow

1. **Starting New Work**
   ```bash
   # Create feature branch
   git checkout -b feature/your-feature-name

   # Copy templates for modification
   cp documentation/base/templates/prd.template.md your-prd.md
   cp documentation/base/templates/db_schema.template.md your-schema.md
   ```

2. **Testing Changes**
   ```bash
   # Verify generator metadata
   documentation/evals/generator_metadata_schema.md

   # Test generation
   documentation/generators/create_requirements_prompt.md
   documentation/generators/create_technical_prompt.md
   documentation/generators/create_prompts_prompt.md

   # Evaluate coverage
   documentation/evals/evaluate_coverage_prompt.md
   ```

3. **Submitting Changes**
   ```bash
   # Update documentation
   git add documentation/
   git commit -m "feat: description of your changes"
   git push origin feature/your-feature-name
   ```

## Quality Standards

1. **Documentation Quality**
   - Clear and consistent terminology
   - Proper cross-referencing
   - Complete traceability
   - Valid metadata

2. **Technical Accuracy**
   - Correct implementation details
   - Valid architectural decisions
   - Proper security considerations
   - Performance requirements

3. **Validation Standards**
   - All required sections present
   - No broken references
   - Complete coverage
   - Consistent formatting 