# [Project Name] Database Schema

## Overview

Database schema for the [project name] application, demonstrating the spec-first approach to data modeling.

## Entities

### users
- id: UUID (PK)
- email: VARCHAR(255) UNIQUE
- passwordHash: VARCHAR(255)
- createdAt: TIMESTAMP
- updatedAt: TIMESTAMP

### [primary_entities]
- id: UUID (PK)
- name: VARCHAR(100)
- description: TEXT
- ownerId: UUID (FK -> users.id)
- createdAt: TIMESTAMP
- updatedAt: TIMESTAMP

### [items]
- id: UUID (PK)
- title: VARCHAR(255)
- description: TEXT
- status: ENUM('[status1]', '[status2]')
- dueDate: TIMESTAMP
- [primary_entity]Id: UUID (FK -> [primary_entities].id)
- createdById: UUID (FK -> users.id)
- assignedToId: UUID (FK -> users.id)
- createdAt: TIMESTAMP
- updatedAt: TIMESTAMP

### [tags]
- id: UUID (PK)
- name: VARCHAR(50)
- color: VARCHAR(7)
- [primary_entity]Id: UUID (FK -> [primary_entities].id)
- createdAt: TIMESTAMP

### [item_tags]
- [item]Id: UUID (FK -> [items].id)
- tagId: UUID (FK -> [tags].id)
- PRIMARY KEY ([item]Id, tagId)

### [entity_members]
- [primary_entity]Id: UUID (FK -> [primary_entities].id)
- userId: UUID (FK -> users.id)
- role: ENUM('viewer', 'editor', 'admin')
- PRIMARY KEY ([primary_entity]Id, userId)

## Indexes

### users
- email_idx: UNIQUE INDEX(email)

### [items]
- [primary_entity]_status_idx: INDEX([primary_entity]Id, status)
- due_date_idx: INDEX(dueDate)
- assigned_to_idx: INDEX(assignedToId)

### [tags]
- [primary_entity]_name_idx: UNIQUE INDEX([primary_entity]Id, name)

## Constraints

### Foreign Keys
- [primary_entities].ownerId -> users.id (CASCADE)
- [items].[primary_entity]Id -> [primary_entities].id (CASCADE)
- [items].createdById -> users.id (NO ACTION)
- [items].assignedToId -> users.id (NO ACTION)
- [tags].[primary_entity]Id -> [primary_entities].id (CASCADE)
- [item_tags].[item]Id -> [items].id (CASCADE)
- [item_tags].tagId -> [tags].id (CASCADE)
- [entity_members].[primary_entity]Id -> [primary_entities].id (CASCADE)
- [entity_members].userId -> users.id (CASCADE)

### Check Constraints
- [items].dueDate >= [items].createdAt
- [tags].color MATCHES '^#[0-9A-Fa-f]{6}$'

## Security Considerations

### Row Level Security
```sql
ALTER TABLE [primary_entities] ENABLE ROW LEVEL SECURITY;
ALTER TABLE [items] ENABLE ROW LEVEL SECURITY;

CREATE POLICY [primary_entity]_access ON [primary_entities]
    USING (id IN (
        SELECT [primary_entity]Id 
        FROM [entity_members] 
        WHERE userId = current_user_id()
    ));

CREATE POLICY [item]_access ON [items]
    USING ([primary_entity]Id IN (
        SELECT [primary_entity]Id 
        FROM [entity_members] 
        WHERE userId = current_user_id()
    ));
```

### Encryption
- Sensitive data (e.g., passwordHash) must be properly hashed
- Consider encryption at rest for [item] descriptions containing sensitive data

## Performance Considerations

### Partitioning
Consider partitioning [items] table by:
- Date ranges for large installations
- [Primary entity] ID for multi-tenant setups

### Materialized Views
```sql
CREATE MATERIALIZED VIEW [item]_stats AS
SELECT 
    [primary_entity]Id,
    status,
    COUNT(*) as [item]Count,
    MIN(dueDate) as nextDueDate
FROM [items]
GROUP BY [primary_entity]Id, status;
```
