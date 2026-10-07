---
name: implement-spec
description: "Implement the result of /to-spec and /to-tickets in code."
disable-model-invocation: true
---

You have been provided a spec. This spec should have tickets associated with it, describing how to implement the spec.

The issue tracker should have been provided to you. If not, tell the user to run `/setup-matt-pocock-skills`.

The goal is the entire spec implemented on a single **integration branch**. Integration, PR readiness, and tracker closure are separate outcomes; perform only the publication and tracker actions already authorized for this run.

The tickets are not a list of steps. They are a **task graph** with blocking relationships between them. This means there is always a **frontier** of tickets which are ready to be grabbed.

Communication to and from subagents should be sparse. Communicate primarily through **context pointers**: to the spec, tickets, research notes, and previous commits. Don't duplicate information already available via pointers.

**Implementer subagents** should be run in the background where possible for maximum concurrency.

## Steps

1. Read the spec and tickets to understand the task graph.

2. (optional) Use an **exploration subagent** to conduct any exploration required by the tickets - relevant codebase files or external documentation. Ensure the exploration subagent can save files - it should save its markdown notes in a directory outside the repo, accessible by all future subagents. This lets **implementer subagents** focus on implementation rather than exploration.

3. Record the intended starting revision and existing worktree status. Preserve unfinished user work; never reset, clean, or overwrite a worktree to make it fit. Create the integration branch from the intended revision and verify the repository path, branch, and starting revision. Use the user's request and tracker configuration to establish whether this run is branch-only or includes PR publication and/or tracker completion. Honor authorization already given and ask only when the target or scope is genuinely unresolved. If an authorized PR is part of the outcome, open a draft after the first integration merge, marked as closing the spec and tickets.

4. Use **implementer subagents** to implement each ticket, each in its own verified worktree on its own branch. Before parallel work starts, verify that each worker has a distinct actual worktree path and branch. If isolation cannot be verified, stop that dispatch rather than running the tickets sequentially.
   - confirms the repository path, branch, and starting revision match the intended integration base before starting; if they do not, stop and report the mismatch so a fresh worktree can be created. Never reset, clean, or reuse a dirty or unrelated worktree, and preserve its unfinished work;
   - calls the Skill tool with `tdd` to build the ticket;
   - preserves checkpoint commits and merges the latest integration branch tip into its own branch before reporting done;
   - reports its branch, final revision, and ticket-owned changed files.

5. Integrate completed worker branches one at a time. Verify each merge on the integration branch and run the relevant checks before recording that ticket as integrated. A ticket is integrated only after its changes are present and those checks pass. Use the original ticket graph to compute the next frontier from verified integration merges, not from tracker closure or a stale blocked-by count.

6. When verified merges change the **frontier**, start implementers for newly unblocked tickets in parallel, after confirming their worktrees are isolated. This allows for maximum concurrency.

7. After all tickets are integrated, run the relevant integration checks and disclose any skipped or unavailable checks. Then call the Skill tool with `code-review` once on the integration branch. Fix verified, actionable findings in a single **implementer subagent**, run focused checks for those fixes, and finish with the integration checks. Do not repeat broad reviews indefinitely.

8. If an authorized draft PR exists, mark it ready only after review fixes and final checks, then read it back to verify its state. The orchestrator owns final tracker transitions: apply only those authorized for this run, then read each item back to verify its state. Do not treat integration or PR readiness as ticket closure. Report the integration branch and distinguish implemented, PR-ready, and closed tickets.

9. Remove only worktrees created by this run, and only after their changes are safely integrated. Leave pre-existing worktrees and unfinished or unintegrated work untouched.
