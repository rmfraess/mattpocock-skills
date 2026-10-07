---
name: implement
description: "Implement a piece of work based on a spec or set of tickets."
disable-model-invocation: true
---

Implement work that is already agreed in a spec, ticket, or plan settled in the conversation. Do not reopen settled design.

Resolve a supplied ticket number through the configured tracker. Proceed when it identifies one ticket unambiguously; ask only when genuine ambiguity could select different work.

Before editing, capture the starting revision with `git rev-parse HEAD` and the starting worktree status. Keep pre-existing and unrelated changes distinct from this run.

Call the Skill tool with "tdd" where possible, at seams already agreed in the spec, ticket, or conversation. Pass that agreement through as the seam confirmation; do not reconfirm each test or cycle. Pause to agree a seam only when none is agreed or a new or materially changed seam is needed.

Run checks required by the assignment and repository rules. During each behavior slice, run focused tests and typecheck after changes affecting types or interfaces, rather than after every patch call. At completion, verify the finished change with the required checks. Use narrower final validation only when explicitly established by the assignment or repository rules; otherwise run the full suite. Earlier results count only when their relevant inputs and environment have not changed since the run; pre-edit evidence does not replace final verification. Report failed or unavailable checks honestly.

Once done, identify this run's changed files, including staged, unstaged, and new files, and exclude unrelated changes. Pass the starting revision, exact changed-file inventory, tracked-file diffs, and complete contents of new files to the Skill tool with "code-review". Do not create a commit solely to make uncommitted work visible to the review.

Commit your work to the current branch.
