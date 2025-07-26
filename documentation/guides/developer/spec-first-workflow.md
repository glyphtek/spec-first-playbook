# Getting Started with AI-Agent Development

This guide will help you start a new project using our AI-agent first approach.

## Prerequisites

1. **System Prompt Setup**
   ```bash
   # Copy the system prompts you'll need:
   - AI-First Playbook's PRD prompt
   - AI-First Playbook's Full-Stack prompt
   - Your agent-specific prompt
   ```

2. **Scale Selection**
   Choose your project's scale level:
   - Minimal (< 100 users)
   - Standard (100-1000 users)
   - Enterprise (1000+ users)
   - Serverless (variable scale)

3. **Initial Project Structure**
   ```bash
   my-project/
   ├── documentation/
   │   └── base/
   │       ├── PRD.md           # Your project's PRD with scale level
   │       └── db_schema.md     # Your database schema
   ```

## Starting with an AI Agent

When starting your project, give these instructions to your AI agent:

1. **Initial Setup Commands**
   ```bash
   # 1. Read and understand these files in order:
   documentation/base/AGENT_GUIDE.md
   documentation/base/PRD.md (note the scale level)
   documentation/base/db_schema.md

   # 2. Validate base documentation and scale requirements
   documentation/evals/generator_metadata_schema.md
   ```

2. **Expected Agent Behavior**
   The agent should:
   - Verify scale level is appropriate
   - Validate technology constraints
   - Ask clarifying questions about the PRD and schema
   - Validate documentation completeness
   - Propose scale-appropriate next steps

## Common Agent Instructions

Use these commands with your AI agent:

1. **Generate Documentation**
   ```bash
   # Tell your agent:
   "Generate scale-appropriate requirements documentation following the templates and guidelines"
   
   # The agent should:
   1. Read the PRD and schema
   2. Verify scale requirements
   3. Use the requirements generator
   4. Validate the output
   5. Ensure scale alignment
   ```

2. **Create Technical Specs**
   ```bash
   # Tell your agent:
   "Create scale-based technical specifications based on our requirements"
   
   # The agent should:
   1. Read the generated requirements
   2. Apply scale-appropriate patterns
   3. Use the technical specs generator
   4. Validate the specifications
   5. Verify scale alignment
   ```

3. **Generate Implementation**
   ```bash
   # Tell your agent:
   "Create scale-specific implementation prompts for [specific component]"
   
   # The agent should:
   1. Read technical specifications
   2. Apply scale-based patterns
   3. Use the prompts generator
   4. Validate implementation guidance
   5. Ensure scale appropriateness
   ```

## Validation Steps

Your agent should validate at each step:

1. **Documentation Validation**
   ```bash
   # The agent should run:
   documentation/evals/evaluate_coverage_prompt.md
   ```

2. **Scale Validation**
   - Verify scale level is appropriate
   - Check technology constraints
   - Validate architecture patterns
   - Ensure performance requirements

3. **Quality Checks**
   - Verify metadata completeness
   - Check cross-references
   - Validate traceability
   - Confirm scale alignment

## Common Issues and Solutions

1. **Incomplete Base Documentation**
   - Agent should ask for missing information
   - Use templates as guidance
   - Validate scale requirements
   - Verify before proceeding

2. **Unclear Requirements**
   - Agent should ask clarifying questions
   - Reference similar requirements
   - Verify scale alignment
   - Propose specific improvements

3. **Missing Dependencies**
   - Agent should identify gaps
   - Suggest required documentation
   - Create dependency tree
   - Check scale compatibility

4. **Scale Misalignment**
   - Verify scale level is appropriate
   - Check technology constraints
   - Adjust architecture if needed
   - Update documentation

## Best Practices

1. **Always Start With**:
   ```bash
   # Tell your agent:
   "Read and understand the AGENT_GUIDE.md first, noting scale requirements"
   ```

2. **For New Features**:
   ```bash
   # Tell your agent:
   "Update PRD.md with new requirements following the template and maintaining scale alignment"
   ```

3. **For Implementation**:
   ```bash
   # Tell your agent:
   "Follow the AI-First Playbook's Confirmation Protocol and scale-appropriate patterns"
   ```

4. **For Scale Changes**:
   ```bash
   # Tell your agent:
   "Update PRD.md with new scale level and regenerate affected documentation"
   ```

## Example Workflow

1. **Starting a New Feature**
   ```bash
   # Agent Command:
   "We need to add user authentication. Please help implement this."

   # Expected Agent Response:
   1. Ask to review current PRD and scale level
   2. Propose scale-appropriate PRD updates
   3. Generate documentation with scale consideration
   4. Create scale-based technical specs
   5. Provide scale-appropriate implementation guidance
   ```

2. **Making Changes**
   ```bash
   # Agent Command:
   "Update the database schema for user roles"

   # Expected Agent Response:
   1. Review current schema and scale level
   2. Propose scale-appropriate changes
   3. Update documentation
   4. Validate changes and scale alignment
   ```

3. **Scaling Up**
   ```bash
   # Agent Command:
   "We need to scale from Standard to Enterprise level"

   # Expected Agent Response:
   1. Review current documentation
   2. Update PRD scale level
   3. Identify affected components
   4. Regenerate technical specs
   5. Update implementation prompts
   6. Provide migration guidance
   ```

## Next Steps

After setup, your agent should:
1. Validate base documentation and scale requirements
2. Generate scale-appropriate initial documentation
3. Create scale-based technical specifications
4. Provide scale-specific implementation guidance

Remember: The agent should always follow the Confirmation Protocol, validate each step before proceeding, and ensure all decisions align with the chosen scale level. 