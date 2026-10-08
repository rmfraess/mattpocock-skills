---
name: gd-implement
description: Implement agreed game code or content changes.
disable-model-invocation: true
---

# Implement Game Work

Implement work already agreed in a spec, ticket, plan, or conversation. Do not reopen settled design. For work involving a live Editor, maps, assets, saves, retries, evidence, or acceptance, read the relevant sections of [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md), the project's effective instructions, approved direction, and version-appropriate engine guidance.

## Before editing

1. Resolve a supplied ticket through the configured tracker. Proceed when it identifies one ticket unambiguously. Ask only when genuine ambiguity could select different work.
2. Capture the repository path, starting revision with `git rev-parse HEAD`, and starting worktree status. Keep pre-existing and unrelated changes distinct from this task.
3. Before live Editor operations, verify the connected Editor's actual project path and authorized checkout, relevant map and asset identities, current unsaved state, available tools, and assigned Editor owner. A worker's Git worktree does not redirect the Editor. Declare exact targets and relevant shared dependencies before dispatch, serialize overlapping or uncertain write scopes, and use an appropriate existing checkpoint or task-scoped recovery point. Preserve unrelated unsaved work.
4. If scope, target, ownership, or material starting state is unresolved, stop the affected operation and report what is missing. Reuse existing approvals and project gates; do not add repeated permission prompts.

## Implement

- Work in small behavior slices and preserve the agreed outcome.
- Use the project's approved testing guidance from the caller alongside the spec, ticket, or conversation. For suitable specified behavior, load `gd-tdd` with the available Skill tool and follow its red-green-refactor method. Reuse agreed seams without reconfirming each test. Do not force visual or content work into an unrelated code-test shape.
- Keep live Editor control and mutation of its active project's assets with the assigned owner for the whole bounded inspect, change, save, and verify segment. Independent research, saved-snapshot inspection, isolated code and tests, and offline asset preparation may proceed separately, but must not control the Editor, write into its active Content tree, or trigger reloads. Transfer ownership only after saved changes are verified and the next owner reconciles current state.
- After a timeout or ambiguous operation, inspect the resulting state before retrying. Complete only reconciled missing work within existing retry limits, or report the unresolved state. Do not replay a potentially completed placement or write blindly.
- For conflicting binary assets, follow an existing authorized resolution plan or pause the affected integration for a plan. Do not silently choose a version.

## Verify and review

Run checks required by the assignment and repository rules. During each behavior slice, run focused tests and typecheck after changes affecting types or interfaces, rather than after every patch. At completion, use the required checks. Use narrower final validation only when the assignment or repository rules explicitly establish it; otherwise run the full suite. Earlier results count only while their relevant inputs and environment remain unchanged. Report failed or unavailable checks honestly.

For persistent content, save only task-owned changes and inspect the persisted result and relevant references. A successful tool response or screenshot alone does not prove the intended saved result. Choose evidence appropriate to the requirement: compilation and behavior tests, saved-asset or map checks, reference checks, in-engine scenarios, visual inspection, or measurements with applicable conditions. Keep technical verification separate from creative acceptance.

Identify this run's exact changed files and assets, including staged, unstaged, and new files, and exclude unrelated work. Verify `gd-code-review` is available before loading it with the Skill tool. Pass the starting revision, complete task-owned inventory, tracked diffs and full new-file contents, plus relevant saved-result and execution evidence. If unavailable, report the dependency and do not silently substitute `code-review`.

Preserve checkpoint commits during implementation and commit the reviewed work to the current branch under the existing project or run policy. Do not create a commit solely to make uncommitted work visible to review.