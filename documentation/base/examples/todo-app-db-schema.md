# Todo App Database Schema

## Overview

Database schema for the todo application, demonstrating the spec-first approach to data modeling.

## Entities

### users
- id: UUID (PK)
- email: VARCHAR(255) UNIQUE
- passwordHash: VARCHAR(255)
- createdAt: TIMESTAMP
- updatedAt: TIMESTAMP

### projects
- id: UUID (PK)
- name: VARCHAR(100)
- description: TEXT
- ownerId: UUID (FK -> users.id)
- createdAt: TIMESTAMP
- updatedAt: TIMESTAMP

### tasks
- id: UUID (PK)
- title: VARCHAR(255)
- description: TEXT
- status: ENUM('pending', 'completed')
- dueDate: TIMESTAMP
- projectId: UUID (FK -> projects.id)
- createdById: UUID (FK -> users.id)
- assignedToId: UUID (FK -> users.id)
- createdAt: TIMESTAMP
- updatedAt: TIMESTAMP

### tags
- id: UUID (PK)
- name: VARCHAR(50)
- color: VARCHAR(7)
- projectId: UUID (FK -> projects.id)
- createdAt: TIMESTAMP

### taskTags
- taskId: UUID (FK -> tasks.id)
- tagId: UUID (FK -> tags.id)
- PRIMARY KEY (taskId, tagId)

### projectMembers
- projectId: UUID (FK -> projects.id)
- userId: UUID (FK -> users.id)
- role: ENUM('viewer', 'editor', 'admin')
- PRIMARY KEY (projectId, userId)

## Indexes

### users
- email_idx: UNIQUE INDEX(email)

### tasks
- project_status_idx: INDEX(projectId, status)
- due_date_idx: INDEX(dueDate)
- assigned_to_idx: INDEX(assignedToId)

### tags
- project_name_idx: UNIQUE INDEX(projectId, name)

## Constraints

### Foreign Keys
- projects.ownerId -> users.id (CASCADE)
- tasks.projectId -> projects.id (CASCADE)
- tasks.createdById -> users.id (NO ACTION)
- tasks.assignedToId -> users.id (NO ACTION)
- tags.projectId -> projects.id (CASCADE)
- taskTags.taskId -> tasks.id (CASCADE)
- taskTags.tagId -> tags.id (CASCADE)
- projectMembers.projectId -> projects.id (CASCADE)
- projectMembers.userId -> users.id (CASCADE)

### Check Constraints
- tasks.dueDate >= tasks.createdAt
- tags.color MATCHES '^#[0-9A-Fa-f]{6}$'

## Security Considerations

### Row Level Security
```sql
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE tasks ENABLE ROW LEVEL SECURITY;

CREATE POLICY project_access ON projects
    USING (id IN (
        SELECT projectId 
        FROM projectMembers 
        WHERE userId = current_user_id()
    ));

CREATE POLICY task_access ON tasks
    USING (projectId IN (
        SELECT projectId 
        FROM projectMembers 
        WHERE userId = current_user_id()
    ));
```

### Encryption
- Sensitive data (e.g., passwordHash) must be properly hashed
- Consider encryption at rest for task descriptions containing sensitive data

## Performance Considerations

### Partitioning
Consider partitioning tasks table by:
- Date ranges for large installations
- Project ID for multi-tenant setups

### Materialized Views
```sql
CREATE MATERIALIZED VIEW task_stats AS
SELECT 
    projectId,
    status,
    COUNT(*) as taskCount,
    MIN(dueDate) as nextDueDate
FROM tasks
GROUP BY projectId, status;
``` 