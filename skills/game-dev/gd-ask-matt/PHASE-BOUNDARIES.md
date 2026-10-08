# Game-development phase boundaries

A phase is a chunk of work inside a session, such as discovery, an experiment, production implementation, or QA. A phase ends when the current work is complete enough to move on. Make the context decision at that boundary. Mid-phase, continue or delegate the remaining scoped work; do not compress away reasoning that is still needed.

## The five options

| Option | What it does |
| --- | --- |
| **Continue** | Stay in the session with the primary source intact. |
| **Fresh conversation** | Start without this thread when its context is irrelevant to the next phase. Use the current harness's supported operation. |
| **`gd-handoff`** | Write a portable markdown brief when game-project state or decisions must travel. |
| **Subagent** | Send a tightly scoped task to its own context window and get a report back. |
| **Compress** | Summarize context to make room for continued work in the same conversation. Use the current harness's supported operation. |

## The decision tree

Work top to bottom at the boundary. The first yes wins.

**1. Can you continue in this session?** Continue when the next phase needs the current work as a primary source, or when there is enough usable context for the remaining work. Discovery to implementation commonly benefits from the original reasoning, not just a summary. Continuing costs no context switch, so rule it out before the other options.

**2. Is the current context irrelevant to what comes next?** If the exploration, decisions, and dead ends are disposable, start a fresh conversation using the current harness. Do not discard relevant context: the reason behind a game-content decision may not be recoverable from the final diff.

**3. Does information need to travel?** Use `gd-handoff` only when switching harness or directory, handing work to a colleague, or forking a side task without derailing the current phase. For game work, include durable task decisions and verified target identifiers when needed. Treat current map state, unsaved changes, live Editor ownership, and other transient observations as time-scoped evidence that must be reconciled before action, not permanent setup rules.

**4. Can the task be done without steering?** Send a tightly scoped, independent task to a subagent when it can proceed without user decisions. Offline research or preparation can often run in parallel. Live Editor work follows the single-owner policy in [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md); a handoff or a second session does not create a second Editor owner.

**5. Otherwise, compress.** When context is relevant, the harness and directory stay the same, and you need to remain involved, compress only at the phase boundary. Preserve the decisions, target scope, and remaining work that the next phase needs.

Compression is a last branch, not the default first reach. The cost of a lossy summary is justified only when the other options fit worse.

## Primary and secondary sources

Every move except **Continue** turns the session as it happened into a secondary source. The trade is the same:

| Source | Information | Noise | Room to move |
| --- | --- | --- | --- |
| Primary, continue | Full | More | Less |
| Secondary, handoff or compression | Lossy | Less | More |

Keep the primary source when its details matter more than the room gained by switching. These are judgment calls, so make them at the actual boundary and state what the next phase must retain.