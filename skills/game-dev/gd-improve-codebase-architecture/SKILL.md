---
name: gd-improve-codebase-architecture
description: Survey game code and assets for architecture friction.
disable-model-invocation: true
---

# Improve Game Codebase Architecture

Surface architectural friction and propose useful deepening opportunities. The survey is on demand and scope-first: it proposes improvements but does not implement them.

Verify `gd-codebase-design` is available, then load it through the available skill-loading tool as a reference for modules, interfaces, depth, seams, adapters, leverage, and locality. Preserve accurate Unreal Engine and project terminology alongside it. If unavailable, report the missing reference rather than silently substituting a conflicting base design helper.

## Process

### 1. Explore the agreed scope

Favor the user's named subsystem, pain point, or direction. Otherwise, inspect recent change history to identify likely friction hotspots, then widen only if there is no useful focus. Read the relevant glossary and ADRs using `GLOSSARY-MAP.md` when present, or the root `GLOSSARY.md` and `docs/adr/` when not.

Explore the relevant code and, where available and useful to the named friction, Blueprint or asset data and dependencies. Consider lifecycle, ownership, serialization and saved references, authoring constraints, and runtime cost only when they affect the candidate. This is not a whole-project asset audit. Do not assume a live Editor is available. If live inspection is needed, report the evidence gap and follow [the game-development working guidance](../GAME-DEVELOPMENT.md) for the verified target and Editor owner.

Use delegated exploration where useful. Follow friction rather than rigid heuristics:

- Where does understanding a behavior require tracing many small modules or assets?
- Where is an interface nearly as complex as its implementation?
- Where does a split hide the actual behavior or its caller context?
- Where do dependencies or asset references spread changes across a seam?
- Which behavior is hard to verify through the current interface or appropriate engine path?

Apply the deletion test to suspected pass-through modules: would deleting one concentrate useful behavior, or only move the complexity elsewhere? Duplication, a smaller interface, new polymorphism, or a language switch is not evidence of benefit by itself. Consider engine and project-native facilities, maintenance and authoring consequences, and verification of preserved behavior. Measure performance claims when relevant; state expected benefits as unmeasured when they are not measured. Do not require a benchmark for every candidate.

### 2. Present candidates as an HTML report

Write a self-contained HTML file to the OS temporary directory so no report lands in the repository. Resolve it from `$TMPDIR`, falling back to `/tmp` or `%TEMP%` on Windows, and use a fresh name such as `architecture-review-<timestamp>.html`. Open it for the user with the platform's available opener and provide its absolute path.

Use inline CSS and hand-built SVG or HTML diagrams by default, with no remotely executed dependencies. Use Mermaid only when a suitable local asset is already available. Keep the report visual and follow [HTML-REPORT.md](./HTML-REPORT.md).

Each candidate includes:

- Files and affected assets, when relevant.
- The concrete source of friction.
- The proposed change in plain English.
- Benefits in leverage, locality, authoring fit, and verification where relevant.
- A before/after diagram.
- One recommendation strength: `Strong`, `Worth exploring`, or `Speculative`.
- Concise costs, risks, or evidence limits when they materially affect the proposal.

Use the project's domain terms and the architectural vocabulary from `gd-codebase-design` for architectural concepts, without renaming actual engine concepts. If a candidate materially conflicts with an ADR, surface it only when the friction warrants reopening that decision, and explain why.

Do not propose a specific interface before the user selects a candidate. After writing the report, ask: "Which of these would you like to explore?"

### 3. Explore a selected candidate

Once the user chooses, load `grilling` through the available skill-loading tool, one skill per call, and follow its decision-tree and delegated fact-gathering method. Work through constraints, dependencies, design shape, and the distinct behavior that needs verification. Use the game-specific lens only where it changes the candidate or decision.

When interface design is needed, load `gd-codebase-design` through the skill loader and use its method. When project-domain terms or decisions materially need clarification, load `gd-domain-modeling` and use its method; verify availability first. Keep any suggested architecture, documentation update, and later implementation distinct. Selection or discussion does not authorize code or asset changes.

If a live Editor operation becomes relevant, read [the game-development working guidance](../GAME-DEVELOPMENT.md) and follow the existing authorization, ownership, and saved-result rules.