---
name: gd-implement-spec
description: Coordinate game specs across code and assets.
disable-model-invocation: true
---

# Implement a Game-Development Spec

Implement the complete spec on one integration branch. Tickets form a dependency graph, not a checklist. Keep integration, PR readiness, and tracker closure separate, and perform only publication or tracker actions already authorized for this run.

If tracker configuration or required project guidance is missing, report the gap rather than guessing. For tickets involving the live Editor, maps, assets, saves, integration, ambiguous outcomes, evidence, or acceptance, read the relevant sections of [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md) and the project's version-appropriate engine guidance.

## Workflow

1. Read the spec and tickets. Map their blocking relationships and the currently ready frontier. Keep communication sparse and pass context pointers to the spec, tickets, research notes, and commits rather than duplicating them.

2. Use an exploration worker for ticket-specific research when useful. Have it save notes outside the repository where later workers can read them.

3. Record the intended starting revision and worktree status. Preserve unfinished work. Create the integration branch from the intended revision and verify its repository path, branch, and starting revision. Reuse the user's request and tracker configuration to determine whether this run includes only implementation or also authorized PR or tracker actions. Ask only when scope or destination is genuinely unresolved. If an authorized PR is part of the outcome, open a draft after the first verified integration checkpoint, marked as closing the spec and tickets, and read it back to verify the target and state.

4. Coordinate the one live Editor through existing assignments and dispatch decisions:
   - Assign one owner for each bounded inspect, change, save, and verify segment. Only that owner controls the Editor or mutates assets in its active project during the segment, including through scripts or direct file writes.
   - Verify the connected Editor's actual project path and authorized checkout. A worker's Git worktree does not redirect the Editor. The owner works in the verified live checkout; other code workers use verified isolated worktrees. Integrate their work into the live checkout after the Editor segment, then perform applicable reloads and checks under the next ownership assignment.
   - Declare exact file and asset targets plus relevant shared dependencies before dispatch. Serialize overlapping or uncertain write scopes. Different tickets, branches, or actor names do not prove isolation.
   - Keep independent research, saved-snapshot inspection, isolated code implementation and tests, and offline asset preparation parallel with separate outputs. These workers do not control the live Editor, write into its active Content tree, trigger Live Coding or reloads, or otherwise interfere with the owner's segment. Tasks needing live checks wait for ownership.
   - Transfer ownership only after relevant changes are saved and verified and the next owner reconciles current state. After a timeout or ambiguous outcome, inspect live state before retrying or handing ownership to another writer.

5. Dispatch ready isolated implementation work in background workers where available, using separate verified worktrees and branches. Before parallel work starts, confirm each actual worktree path and branch is distinct. If isolation cannot be verified, stop that dispatch rather than running those tickets sequentially. Each isolated worker confirms its repository, branch, and starting revision match the intended integration base before starting. A mismatch requires a fresh worktree; never reset, clean, or reuse a dirty or unrelated worktree. Assign live Editor segments to the owner in the verified live checkout, not to an unrelated worker worktree. Establish how that checkout participates in the integration branch before mutation; resolve a routing mismatch without silently switching projects or disturbing unsaved work.
   - Give each worker the ticket, exact authorized targets, shared dependencies, relevant saved state, and task-appropriate validation guidance from the ticket or spec. Reuse approved testing choices and standing scope references without reopening settled design.
   - For suitable specified behavior, load `gd-tdd` with the available Skill tool and follow its method. For content work, specify relevant saved-map or asset, reference, visual, or in-engine checks instead of inventing a code-test substitute.
   - Isolated branch workers preserve checkpoint commits, merge the latest integration tip into their own branch before reporting done, and report their branch, final revision, ticket-owned file and asset inventory, checks, and evidence. The live Editor owner saves and verifies its segment in the actual checkout, preserves the applicable checkpoint-commit policy, and reports the actual revision and saved-content evidence. Do not attribute live changes to an unchanged worker branch.

6. Integrate completed branches one at a time. For a conflicting binary asset, use an existing authorized resolution plan when it covers the conflict. Otherwise pause that integration for a resolution plan; do not treat binary assets as ordinary text merges or silently select a version. Verify the resulting saved asset and relevant references. Coordinate any merge or file replacement affecting the live Editor checkout with its owner.

7. After each merge or live-content integration checkpoint, run the relevant checks and record the ticket as integrated only when its changes are present in the integration result and those checks pass. Compute the next frontier from verified integration checkpoints, not tracker closure or a stale blocked-by count. Start newly unblocked isolated workers in parallel only after confirming their worktrees are isolated; assign any required live Editor segment through the existing ownership process.

8. After all tickets are integrated, verify the combined result against the complete parent spec, run the required integration checks, and report skipped or unavailable checks. Then verify `gd-code-review` is available and load it once for the final integrated result. Supply the parent spec as the originating spec, the starting revision, the exact integrated code, map, and asset inventory, tracked diffs and new-file contents, plus relevant saved-result and execution evidence. Reviewers inspect supplied evidence without competing for Editor control. This is one broad integration review, not a second review pipeline for each ticket. If the skill is unavailable, report the dependency and do not silently substitute another review workflow.
   - Fix verified, actionable findings in one implementer worker, run focused checks for those fixes, and finish with the integration checks. Do not repeat broad reviews indefinitely.
   - Keep technical verification separate from creative or game-feel acceptance. A reviewer's favorable description is not user approval; record the user's verdict when provided, otherwise mark it pending or not applicable.

9. If an authorized draft PR exists, mark it ready only after review fixes and final checks, then read it back to verify its state. The orchestrator owns final tracker transitions. Apply only those authorized for this run and read each item back. Report the integration branch and distinguish implemented, PR-ready, and closed tickets; these remain separate outcomes.

10. Remove only worktrees created by this run, and only after their changes are safely integrated. Leave pre-existing worktrees and unfinished or unintegrated work untouched.