---
name: gd-code-review
description: Review game code, assets, and validation evidence.
---

# Game Code Review

Use this for a branch, PR, work in progress, or a request to review "since X". Review has two independent axes:

- **Standards:** does the change follow this repository's documented standards?
- **Spec:** does it implement the originating issue or spec?

Run the Standards and Spec reviews in parallel, then aggregate their findings. For reviews involving maps, assets, saved results, Editor ownership, or game-feel evidence, read the relevant sections of [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md). If `docs/agents/issue-tracker.md` is missing, report the gap and ask the user to resolve it through the project's configured setup workflow.

## Process

### 1. Establish the review scope

Use one of two explicit modes:

- **Committed history:** use the fixed point supplied by the user, such as a commit SHA, branch, tag, `main`, or `HEAD~5`. If an explicitly identified PR has no supplied point, verify its base and head metadata, confirm local HEAD matches the PR head, and report the resolved revisions. If metadata is unavailable, refs do not resolve, or the checkout does not match, report the discrepancy and ask rather than guessing or changing the checkout. Otherwise ask for the missing fixed point.
- **Implementation scope:** use the starting revision and exact task-owned changed-file and asset inventory supplied by the caller. Cover staged, unstaged, and new files; exclude unrelated work; include tracked-file diffs and complete new-file contents. For non-text maps or assets, also require available semantic, reference, saved-state, runtime, or visual evidence appropriate to the claims. Review the intended outputs, not only the script or text diff that produced them. Do not widen the scope or fall back to committed history. If required material is missing, report it before dispatching reviewers.

For committed history, capture `git diff <fixed-point>...HEAD` once and list commits with `git log <fixed-point>..HEAD --oneline`. Keep this mode unchanged when requested. Before continuing, confirm the fixed point resolves and the diff is non-empty, or confirm the supplied implementation scope is complete and non-empty.

Review only the supplied evidence and scope. A necessary live Editor check is coordinated through one assigned Editor owner, who verifies the actual project and checkout and provides the result. Reviewers inspect supplied diffs, inventories, logs, saved-state reports, and captures; they do not take Editor control, mutate content, or authorize a save. Missing or stale evidence is unverified, not a technical pass.

### 2. Identify the spec source

Look for the originating spec in this order:

1. Issue references in commit messages, fetched through the project's issue-tracker workflow.
2. A path supplied by the user.
3. A spec under `docs/`, `specs/`, or `.scratch/` matching the branch or feature.
4. If no spec is found, ask where it is. If the user says there is none, the Spec reviewer skips and reports "no spec available."

### 3. Identify standards sources

Read repository documents that describe how code and content should be produced, such as `CODING_STANDARDS.md` or `CONTRIBUTING.md`. Apply actual engine and project conventions. Smell suggestions are advisory; do not demand extra abstraction, polymorphism, or a rewrite only to satisfy a generic heuristic. Repository standards override the following smell baseline, and each smell remains a judgement call rather than a hard violation. Skip anything tooling already enforces.

- **Mysterious Name:** a function, variable, or type name does not reveal what it does or holds. Rename it; if no honest name fits, the design may be unclear.
- **Duplicated Code:** the same logic shape appears in multiple hunks or files. Extract the shared shape and call it from each site.
- **Feature Envy:** a method reaches into another object's data more than its own. Consider moving it onto that data.
- **Data Clumps:** the same fields or parameters keep travelling together. Bundle them into a type and pass that.
- **Primitive Obsession:** a primitive or string stands in for a domain concept that deserves a type. Give the concept a small type.
- **Repeated Switches:** the same conditional on the same type recurs. Consider polymorphism or one shared map.
- **Shotgun Surgery:** one logical change forces scattered edits. Gather the related behavior into one module.
- **Divergent Change:** one file or module changes for unrelated reasons. Separate those reasons.
- **Speculative Generality:** abstractions, parameters, or hooks lack a current requirement. Delete them and inline back until a real need exists.
- **Message Chains:** long navigation exposes details callers need not know. Hide the walk behind a method on the first object.
- **Middle Man:** a class or function mostly delegates. Remove it and call the real target directly.
- **Refused Bequest:** a subclass or implementer ignores or overrides most inherited behavior. Drop the inheritance in favor of composition.

### 4. Spawn both reviewers in parallel

This is review-only. Neither reviewer edits files, commits, fixes findings, invokes `gd-code-review` recursively, or dispatches more reviewers. Implementers may address verified findings and commit afterward.

The **Standards** prompt includes the complete supplied scope, standards-source list, and smell baseline above. Ask it to review only the supplied scope, cite each documented standard by file and rule, identify any spotted smell with its relevant hunk, distinguish violations from judgement calls, and stay under 400 words.

The **Spec** prompt includes the complete supplied scope and spec path or contents. Ask it to report missing or partial requirements, unrequested behavior, and apparently implemented requirements that look wrong, quoting the relevant spec requirement, and stay under 400 words. If the spec is missing, skip this reviewer and say so.

### 5. Aggregate

Verify each finding's location and supporting standard or requirement before confirming it. Correct or omit unsupported claims, label claims that cannot be verified, and reconcile each review's finding count. Present reports under `## Standards` and `## Spec` without merging or reranking their findings.

Add a concise **Execution Evidence** assessment as an aggregation step, not a third reviewer. State what was run and inspected, whether evidence matches the reviewed state, which checks failed or were unavailable, and which completion claims remain unverified. Separate technical verification from creative or game-feel acceptance. Attribute a user verdict only when the user supplied it; a favorable reviewer description is not user approval. Mark creative acceptance not applicable when no such decision exists.

End with one line giving findings per axis and the worst issue within each axis, if any. Do not select a single winner across axes.