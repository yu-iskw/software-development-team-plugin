---
name: write-requirements
description: Write user stories, acceptance criteria, and technical requirements for a feature or change. Use when defining what needs to be built.
argument-hint: "[feature description]"
context: fork
agent: product-manager
---

# Write Requirements

Write detailed requirements for the following feature:

$ARGUMENTS

## Requirements Format

For each requirement, produce:

### User Story

```text
As a [user type],
I want to [action],
So that [benefit].
```

### Acceptance Criteria

- [ ] Given [context], when [action], then [result]
      (Include happy path, error cases, and edge cases)

### Technical Requirements

- Data model changes needed
- API endpoints affected
- UI components affected
- Non-functional requirements (performance, security, accessibility)

### Out of Scope

- What is explicitly NOT included in this feature

Consider all layers: frontend, backend, shared components, and integrations.
