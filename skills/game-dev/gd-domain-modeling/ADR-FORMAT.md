# ADR Format

Place an ADR where the decision belongs:

- In a single-context repository, use the root `docs/adr/` directory.
- In a multi-context repository with a root `GLOSSARY-MAP.md`, use the context-specific `docs/adr/` described by the map for a context decision. Use the root `docs/adr/` for a system-wide decision.

Create the chosen `docs/adr/` directory lazily, only when the first ADR is needed there.

## Template

```md
# {Short title of the decision}

{One to three sentences: what is the context, what was decided, and why.}
```

An ADR can be a single paragraph. Record that a decision was made and why, not a collection of required sections.

## Optional sections

Include these only when they add genuine value. Most ADRs need none.

- **Status** frontmatter (`proposed | accepted | deprecated | superseded by ADR-NNNN`): useful when a decision is revisited.
- **Considered Options:** include rejected alternatives only when they are worth remembering.
- **Consequences:** include non-obvious downstream effects when they matter.

## Numbering

Scan the actual destination directory for its highest existing number and increment by one. Each context-specific directory has its own sequence. Do not number from another context's ADRs.

## When to offer an ADR

All three conditions must be true:

1. **Hard to reverse:** changing the decision later has meaningful cost.
2. **Surprising without context:** a future reader would wonder why it was chosen.
3. **A real trade-off:** there were genuine alternatives and specific reasons for the choice.

If a decision is easy to reverse, skip it. If it is unsurprising, or there was no real alternative, there is little value in recording it.

### What qualifies

- **Architectural shape:** for example, choosing a monorepo or event-sourced write model.
- **Integration patterns between contexts:** for example, domain events rather than synchronous HTTP.
- **Technology choices with lock-in:** a database, message bus, auth provider, or deployment target, not every library.
- **Boundary and scope decisions:** for example, which context owns customer data and how others refer to it.
- **Deliberate deviations from the obvious path:** record a non-obvious choice that a future maintainer might otherwise reverse.
- **Constraints not visible in the code:** for example, compliance requirements or a partner API contract.
- **Rejected alternatives:** record a non-obvious rejection when future contributors are likely to propose it again.