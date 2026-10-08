---
name: gd-codebase-design
description: Design game-code interfaces, seams, and modules.
---

# Game Codebase Design

Design **deep modules**: substantial behavior behind a clear interface, placed at a useful seam and testable through that interface. Use the architectural language below when those concepts are meant, alongside accurate Unreal Engine and project terminology. The aim is leverage for callers, locality for maintainers, and practical testability.

## Architecture vocabulary

- **Module:** anything with an interface and implementation, from a function or class to a package or tier-spanning slice. Keep this architectural meaning distinct from native engine concepts such as an Unreal `UActorComponent`.
- **Interface:** everything a caller must know to use a module correctly, including type surface, invariants, ordering, errors, configuration, and performance characteristics. An engine interface or public API can also be named accurately when that is the actual concept.
- **Implementation:** what sits inside a module. An **adapter** is a concrete thing that satisfies an interface at a seam; the word describes its role.
- **Depth:** behavior and leverage at the interface. A module is deep when callers gain substantial behavior through a clear interface, and shallow when the interface is nearly as complex as the implementation.
- **Seam:** the location where behavior can vary through an interface. Keep this architectural meaning distinct from engine or domain meanings such as collision boundaries.
- **Leverage:** capability callers gain per interface they must learn.
- **Locality:** how much change, bugs, knowledge, and verification stay in one place.

Use module, interface, implementation, depth, seam, adapter, leverage, and locality when discussing those architectural ideas. Keep precise engine and project terms when they name the actual thing; do not rename a real engine component or subsystem to satisfy architectural vocabulary.

## Deep vs shallow

A deep module provides a relatively clear interface over substantial implementation. A shallow module exposes nearly as much complexity as it hides. Ask whether the interface can be simpler and whether more behavior can be placed behind it, but do not optimize method count in isolation.

The deletion test helps identify pass-through modules: if deleting one makes complexity disappear, it may not earn its place; if complexity spreads across callers, it may provide useful locality. A small interface is a heuristic, not the goal. Judge whether the design makes the actual task easier to understand and maintain.

## Design principles

- **Depth belongs to the interface.** A module may use small internal seams for its own tests without exposing them to callers.
- **One adapter often signals a hypothetical seam.** Introduce a seam when real variation justifies it, commonly a production path and a distinct test path.
- **The interface is the test surface.** Verify meaningful caller-visible behavior through it. Keep engine integration, lifecycle, persistence, asset-reference, or saved-state checks when those cover distinct behavior.
- **Accept dependencies when useful.** Injecting a dependency can make behavior replaceable, but do not add an adapter or dependency-injection framework without a real need.
- **Prefer pure calculations when they simplify reasoning or testing.** Required world or asset mutations are legitimate operations. Give them explicit targets and scope, relevant preconditions, observable outcomes, and a recovery approach. Separate calculation from application only when it genuinely improves the design; there is no required planner/executor structure.
- **Preserve the real game behavior.** Consider lifecycle and ownership, ordering, persistence and asset references, authoring constraints, error handling, and runtime behavior when they affect the proposal. Use measurements for performance claims, and invent no gains or benchmark requirement.
- **Reuse native facilities.** Prefer existing engine and project capabilities to speculative wrappers, generic frameworks, or adapters added only to make a design look reusable.

## Relationships

- A module has an interface that callers and tests use.
- Depth is judged at that interface.
- A seam is where the interface permits behavior to vary.
- An adapter satisfies the interface at a seam.
- Depth can produce leverage for callers and locality for maintainers.

## Going deeper

- For dependency categories, engine-coupled behavior, seams, and test replacement, read [DEEPENING.md](./DEEPENING.md).
- To explore alternative interfaces for a chosen candidate with parallel workers, read [DESIGN-IT-TWICE.md](./DESIGN-IT-TWICE.md).
- For live Editor ownership, authorized targets, saving, and result verification, read [the game-development working guidance](../GAME-DEVELOPMENT.md). This design skill proposes; it does not authorize project changes.