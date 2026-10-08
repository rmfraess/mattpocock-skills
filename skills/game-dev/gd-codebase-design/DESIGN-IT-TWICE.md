# Design It Twice

When the user wants to explore alternative interfaces for a chosen deepening candidate, use this parallel-worker pattern. A first design is unlikely to be the only useful one. This remains a proposal and comparison exercise; it does not authorize Editor or project mutations.

Use the vocabulary in [SKILL.md](./SKILL.md): module, interface, implementation, depth, seam, adapter, leverage, and locality. Keep accurate engine and project terms too.

## Process

### 1. Frame the problem space

Before dispatching workers, explain the chosen candidate and the constraints an interface must satisfy:

- Relevant callers and behavior to preserve.
- Dependencies and their category from [DEEPENING.md](./DEEPENING.md).
- Lifecycle, ownership, ordering, persistence, asset references, authoring needs, engine integration, or runtime cost when they affect the candidate.
- A rough illustrative code sketch to make the constraints concrete, not a proposal.

Show the problem space to the user, then start the worker designs. The user can consider the framing while the independent designs proceed.

### 2. Spawn parallel workers

Spawn at least three workers in parallel. Give each a separate technical brief with relevant paths, coupling, dependency category, what sits behind the seam, and the project's domain vocabulary. Assign different constraints:

- Worker 1: minimize the interface and maximize leverage per entry point.
- Worker 2: maximize useful flexibility and extension.
- Worker 3: optimize for the most common caller.
- Worker 4, when useful: design around ports and adapters for a genuine cross-seam dependency.

Each worker returns:

1. Interface shape, including invariants, ordering, and error modes.
2. A usage example showing how callers use it.
3. What implementation behavior sits behind the seam.
4. Dependency and adapter strategy from [DEEPENING.md](./DEEPENING.md).
5. Trade-offs in leverage, locality, engine or authoring fit, and verification where relevant.

Workers propose designs only. Do not direct them to mutate the project or operate the live Editor.

### 3. Compare and recommend

Present designs in turn, then compare them by depth, locality, seam placement, relevant game constraints, and distinct verification needs. Make a recommendation and explain why. Propose a hybrid only when its parts fit together without adding needless machinery.