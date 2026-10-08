---
name: gd-ask-matt
description: Use to choose an appropriate game-development skill.
disable-model-invocation: true
---

# Ask Matt for game-development routes

Map the request to the smallest suitable route. Recommend it and stop. This skill does not run the recommended workflow, assign Editor ownership, change tracker state, grant approval, or publish work.

Before claiming a target's behavior or recommending that it be skipped, verify that its exact skill is available in the current harness. Read only the relevant target `SKILL.md` with an available skill-reading or file-reading capability, one target at a time. Use file reading when the host restricts model-invoked loading of that target. Reading verifies the route without running its workflow. A package name in this source tree is not proof that it is installed. If the target is missing, report that and do not silently substitute a conflicting workflow.

Choose by the user's actual need. Do not force every request through an idea-to-ship sequence, and do not describe native content work as necessarily code work.

## Routes

| Need | Recommend |
| --- | --- |
| Missing engineering setup or unresolved game-project working rules | `gd-setup-matt-pocock-skills`. It covers both in one read, reuse, resolve, draft, and confirmed-write flow. |
| Sharpen an idea in a working project | `gd-grill-with-docs`. For a repo-free interview, `gd-grill-me`. Both use the unchanged `grilling` helper. |
| Factual engine, tool, or documentation question | Unchanged `research`. Verify current engine versions and primary sources rather than guessing. |
| Decide visual direction, game feel, or playable behavior | `gd-prototype` for a faithful, scoped game-engine experiment, not an unrelated web mockup. |
| Turn agreed direction into a durable multi-session plan | `gd-to-spec`, then `gd-to-tickets` when work should be split into tickets. Skip specification when the work is already sufficiently scoped. |
| Implement one authorized, sufficiently defined task | `gd-implement`. For a full task graph in one run, `gd-implement-spec`. |
| Build a concrete behavior test-first | `gd-tdd` where possible. For a technical review against a fixed point, `gd-code-review`. |
| Triage incoming issues or external PRs | `gd-triage`. For a hard bug that needs a tight reproduction loop, `gd-diagnosing-bugs`. |
| Explore a huge effort whose path is not yet visible | `gd-wayfinder`; it resolves decisions and hands off planning, it does not build the work. |
| Improve architecture or shape a module | `gd-improve-codebase-architecture` to find opportunities; `gd-codebase-design` to design a selected module. |
| Resolve domain terms or durable domain decisions | `gd-domain-modeling`. |
| Carry game-project state to another session, harness, directory, or colleague | `gd-handoff` only when a portable, state-aware handoff is useful. |
| Write a pull-request body | `gd-pr`; it is writing-only and does not publish or merge. |
| Learn from completed work | `gd-retro` in the session being reviewed, when practical. |

At a phase boundary, use the decision tree in [PHASE-BOUNDARIES.md](./PHASE-BOUNDARIES.md). For a portable, state-aware game-project handoff, recommend `gd-handoff` only when information needs to travel.

The approved routes that inspect or change live game content should follow the relevant rules in [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md). Parallelize independent research or offline preparation; live Editor work follows the shared one-owner policy. This router recommends a route but does not coordinate or execute it.

## Compatible unchanged helpers

Use the existing `research`, `grilling`, `writing-for-agents`, and `teach` skills where their methods fit. Do not create or require game-specific copies of these helpers. When a workflow needs one, verify it is available and load it with the current harness's skill-loading tool, one skill per call, then follow its method.

## Excluded derivatives

These were explicitly excluded from the approved game-development set and are not routes:

- `gd-research`: use unchanged `research` for factual research.
- `gd-writing-for-agents`: use unchanged `writing-for-agents` for agent-facing documents.
- `gd-setup-project-rules`: use the combined `gd-setup-matt-pocock-skills` when setup or working rules are genuinely missing.

## Stop

Give the recommended skill name, a short reason, and any key prerequisite or unverified availability. Do not invoke it, dispatch work, start an Editor, create or update issues, or infer approval from the recommendation. The user chooses whether to proceed.