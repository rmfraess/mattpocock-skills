---
name: gd-domain-modeling
description: Clarify game-domain terms, states, and decisions.
---

# Game Domain Modeling

Actively build and sharpen the project's domain model as you design. Challenge ambiguous terms, use concrete scenarios to expose edge cases, and record resolved terminology and meaningful durable decisions when they crystallize. Reading an existing glossary for vocabulary is a one-line habit; use this skill when the model itself is changing.

## File structure

Most repositories have one domain context:

```
/
├── GLOSSARY.md
├── docs/
│   └── adr/
│       └── 0001-important-decision.md
└── Source/
```

If a `GLOSSARY-MAP.md` exists at the root, the repository has multiple contexts. Use its context paths for glossaries and context decisions, and its root ADR location for system-wide decisions.

Create files lazily, only when there is something to record. Create a glossary when the first term is resolved, and an ADR directory only when a decision meets the ADR criteria below.

## During the session

### Challenge terms and sharpen language

When a user's term conflicts with the existing glossary, identify the conflict and ask which meaning applies. For vague or overloaded language, propose a precise project term and distinguish it from nearby concepts.

Keep established engine terminology when it names a real engine concept. Define a project-specific meaning only when it needs clarification; the glossary is not an engine API dictionary.

### Test game concepts with scenarios

When it matters to the rules being designed, use concrete scenarios to separate current world state, what the player knows, story events, and quest objectives. For example, a gate may have opened in the past, be closed now, remain undiscovered by the player, and still be the target of an objective. Do not impose this as a mandatory four-part schema when the distinctions do not affect the domain.

### Cross-check implementation and evidence

Check claims against relevant code and, where available, Blueprint or asset data, saved project evidence, or authorized live observations. State what each source does and does not establish. Intended behavior and observed implementation can disagree; surface that disagreement instead of silently treating either as the other.

For a live Editor inspection, read [the game-development working guidance](../GAME-DEVELOPMENT.md) and follow its current-target and single-owner rules. This documentation skill does not authorize project mutations.

### Update the glossary inline

When a project-specific term is resolved, update the appropriate `GLOSSARY.md` during the discussion. Use [GLOSSARY-FORMAT.md](./GLOSSARY-FORMAT.md). Keep the glossary about domain language, not implementation, a specification, or a scratch pad.

### Record adaptation provenance when relevant

For adaptations, keep verified source canon distinct from deliberate adaptation decisions, exploratory variants, and approved visual direction. Put relevant source, reference, and evidence pointers in existing project records; label unverified claims and provisional ideas plainly. Do not promote a plausible variant or observed asset into source canon or approved direction, and do not create a new canon database or a required document for every choice.

### Offer ADRs sparingly

Offer an ADR only when all three are true:

1. **Hard to reverse:** changing the decision later has meaningful cost.
2. **Surprising without context:** a future reader would wonder why it was chosen.
3. **A real trade-off:** there were genuine alternatives and specific reasons for the choice.

If any condition is missing, skip the ADR. Use [ADR-FORMAT.md](./ADR-FORMAT.md). Keep tentative creative direction provisional in the project's existing notes; do not record it as a resolved glossary term or accepted ADR.