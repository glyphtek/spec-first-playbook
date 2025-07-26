# Standardized Documentation Evaluation Tool

## Overview
This tool provides a standardized approach to evaluating generated documentation, ensuring consistent results across different AI models and evaluators.

## Metadata Schema
```yaml
evaluation_metadata:
  version: "1.0.0"
  evaluator_info:
    name: string          # Name of the evaluating agent/person
    model: string         # Model/version used (if AI)
    timestamp: datetime   # Evaluation timestamp
  base_documents:
    - document: string    # Document name
      version: string     # Document version
      path: string       # Document path
      hash: string       # Git hash or file hash for versioning
  coverage_metrics:
    core_requirements: number     # 0-100%
    extended_requirements: number # 0-100%
    diagrams: number             # 0-100%
  gap_metrics:
    critical: number     # Count of critical gaps
    enhancement: number  # Count of enhancement gaps
    future: number      # Count of future gaps
  scale_metrics:
    alignment: number    # 0-100%
    tech_fit: number    # 0-100%
  quality_metrics:
    documentation: number # 0-100%
    technical: number    # 0-100%
```

## Evaluation Process

### 1. Initial Requirements Extraction
```markdown
1. Read Base Documentation:
   - PRD
   - DB Schema
   - Additional specifications

2. Extract Requirements:
   | ID | Type | Requirement | Source | Priority | Scale Impact |
   |----|------|-------------|---------|----------|--------------|
   [List all requirements with unique IDs]

3. Classify Requirements:
   - Core: Must have for MVP
   - Extended: Important but not MVP
   - Future: Nice to have

4. Scale Classification:
   - Minimal: Basic functionality
   - Standard: Team features
   - Enterprise: Organization features
   - Serverless: Cloud-native features
```

### 2. Coverage Analysis
```markdown
1. Documentation Mapping Matrix:
   | Req ID | Requirement | Documentation | Coverage | Status |
   |--------|-------------|---------------|----------|---------|
   [Map each requirement to documentation]

2. Coverage Types:
   - Complete: All aspects documented
   - Partial: Core aspects documented
   - Missing: No documentation

3. Coverage Calculation:
   - Core Coverage % = (Completed Core Reqs / Total Core Reqs) * 100
   - Extended Coverage % = (Completed Extended Reqs / Total Extended Reqs) * 100
```

### 3. Gap Analysis
```markdown
1. Gap Classification:
   | Gap ID | Requirement ID | Type | Impact | Priority |
   |--------|---------------|------|---------|-----------|
   [List all identified gaps]

2. Gap Types:
   - Critical: Blocks core functionality
   - Enhancement: Affects quality/performance
   - Future: Nice-to-have features

3. Impact Assessment:
   - High: Blocks implementation
   - Medium: Affects quality
   - Low: Minor improvement
```

### 4. Quality Assessment
```markdown
1. Documentation Quality Matrix:
   | Aspect | Score | Notes |
   |--------|-------|-------|
   | Clarity | 1-5 | [Notes] |
   | Structure | 1-5 | [Notes] |
   | Completeness | 1-5 | [Notes] |
   | Consistency | 1-5 | [Notes] |

2. Technical Quality Matrix:
   | Aspect | Score | Notes |
   |--------|-------|-------|
   | Scale Alignment | 1-5 | [Notes] |
   | Tech Stack Fit | 1-5 | [Notes] |
   | Architecture | 1-5 | [Notes] |
   | Security | 1-5 | [Notes] |
```

### 5. Scale Alignment
```markdown
1. Scale Requirements Matrix:
   | Aspect | Required | Provided | Status | Migration Path |
   |--------|----------|----------|---------|----------------|
   [Check each scale requirement]

2. Technology Fit Matrix:
   | Technology | Scale Fit | Notes | Scaling Considerations |
   |------------|-----------|-------|----------------------|
   [Evaluate each technology choice]

3. Scale Transition Analysis:
   | From Scale | To Scale | Effort | Impact | Key Changes |
   |------------|----------|--------|---------|-------------|
   [Analyze potential scale transitions]
```

### 6. Diagram Evaluation
```markdown
1. Diagram Coverage Matrix:
   | Requirement | Diagram Type | Status | Quality |
   |-------------|--------------|--------|----------|
   [List required diagrams]

2. Diagram Types:
   - Architecture: System/component diagrams
   - Flow: Sequence/process diagrams
   - Data: ER/schema diagrams
   - Deployment: Infrastructure diagrams

3. Quality Criteria:
   - Clarity: Easy to understand
   - Completeness: Covers all aspects
   - Consistency: Matches documentation
   - Technical Accuracy: Correct notation
```

## Evaluation Output

### 1. Summary Report
```markdown
# Evaluation Summary

## Overview
- Base Documentation: [List documents]
- Generated Documentation: [List documents]
- Overall Coverage: XX%
- Quality Score: XX/100

## Key Metrics
- Core Requirements Coverage: XX%
- Extended Requirements Coverage: XX%
- Critical Gaps: XX
- Quality Score: XX/100
- Scale Alignment: XX/100

## Recommendation Status
- Must Fix: XX items
- Should Fix: XX items
- Could Fix: XX items
```

### 2. Detailed Reports
```markdown
1. Coverage Report:
   [Full coverage matrix]

2. Gap Report:
   [Detailed gap analysis]

3. Quality Report:
   [Quality assessment details]

4. Scale Report:
   [Scale alignment details]
```

### 3. Action Items
```markdown
1. Critical Actions:
   - [List must-fix items]
   - [Include specific references]
   - [Provide clear steps]

2. Improvements:
   - [List should-fix items]
   - [Include rationale]
   - [Suggest approaches]

3. Future Enhancements:
   - [List could-fix items]
   - [Include benefits]
   - [Suggest timeline]
```

## Usage Instructions

1. **Preparation**
   ```bash
   # 1. Ensure all required documents are available:
   - Base documentation (PRD, DB Schema)
   - Generated documentation
   - Evaluation templates
   ```

2. **Evaluation**
   ```bash
   # 2. Follow the process in order:
   1. Extract requirements
   2. Analyze coverage
   3. Identify gaps
   4. Assess quality
   5. Check scale alignment
   ```

3. **Reporting**
   ```bash
   # 3. Generate all required reports:
   1. Create summary report
   2. Complete detailed reports
   3. List action items
   ```

## Success Criteria

### 1. Coverage Success
- Core Requirements: ≥95%
- Extended Requirements: ≥85%
- Diagram Coverage: ≥90%
- No Critical Gaps
- All Must-Fix Items Identified

### 2. Quality Success
- Documentation Quality: ≥4/5
- Technical Quality: ≥4/5
- Scale Alignment: ≥90%
- Diagram Quality: ≥4/5
- Clear Action Items

### 3. Process Success
- All Steps Completed
- All Matrices Filled
- All Reports Generated
- Clear Next Steps
- Migration Paths Identified

### 4. Scale Success
- Scale Level Appropriate
- Technology Choices Aligned
- Growth Path Clear
- Migration Steps Defined

## Evaluation Examples

### 1. Requirements Example
```markdown
| ID    | Type | Requirement | Source | Priority | Scale Impact |
|-------|------|-------------|---------|----------|--------------|
| CR1   | Core | User Auth   | PRD/2.1 | High    | All Scales   |
| CR2   | Core | Task CRUD   | PRD/3.1 | High    | All Scales   |
| ER1   | Ext  | Real-time   | PRD/4.2 | Medium  | Standard+    |
```

### 2. Gap Analysis Example
```markdown
| Gap ID | Req ID | Type    | Impact | Priority |
|--------|--------|---------|---------|----------|
| GAP1   | ER1    | Enhance | Medium  | Medium   |
| GAP2   | -      | Future  | Low     | Low      |
```

### 3. Scale Analysis Example
```markdown
| From    | To        | Effort | Impact | Key Changes        |
|---------|-----------|--------|--------|-------------------|
| Minimal | Standard  | Medium | Medium | Add team features |
| Standard| Enterprise| High   | High   | Add org features  |
```

## Notes
- Always evaluate against base requirements first
- Focus on core functionality before extensions
- Consider scale requirements throughout
- Provide actionable feedback
- Include specific references
- Maintain objective scoring
- Document scale transition paths
- Verify diagram completeness
- Consider future maintainability 