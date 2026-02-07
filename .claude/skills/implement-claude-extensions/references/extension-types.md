# Extension Types

| Type        | Trigger                   | Core Deliverable                      | Key Risk                                    |
| ----------- | ------------------------- | ------------------------------------- | ------------------------------------------- |
| Hooks       | Runtime events            | Hook config + scripts                 | Over-broad matching and unintended triggers |
| Skills      | Task invocation           | `SKILL.md` + references/scripts       | Ambiguous scope and overlap                 |
| Sub-Agents  | Delegation                | Agent definitions and boundaries      | Excess permissions or vague ownership       |
| Agent Teams | Multi-agent orchestration | Team setup and coordination contracts | Coordination overhead                       |
| Plugins     | Packaging/distribution    | Manifest + directory wiring           | Broken paths and load failures              |
