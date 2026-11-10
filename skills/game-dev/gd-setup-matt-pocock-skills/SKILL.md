---
name: gd-setup-matt-pocock-skills
description: Use for engineering setup and game-project working rules.
disable-model-invocation: true
---

# Game-project engineering setup and working rules

This user-invoked skill handles both engineering setup and game-project rule definition in one workflow. Read what exists, reuse settled choices, resolve only material gaps or conflicts, show one consolidated draft, get confirmation, then write only the confirmed guidance. A rules-only revisit uses this same workflow and skips settled engineering setup.

This configures documentation only. It does not install skills, tools, plugins, or profiles; create tracker issues or labels; launch or mutate the Editor; assign live-resource ownership; or change runtime permissions.

## 1. Read the current setup

Start from the repository root and the working directory. Read the active harness's effective project instructions, including applicable layered instructions, and preserve their precedence and surrounding content. Inspect only relevant existing project guidance and configuration:

- Tracker configuration and repository remotes, to learn where issues live and whether pull or merge requests are a request surface.
- `docs/agents/issue-tracker.md`, `docs/agents/triage-labels.md`, and `docs/agents/domain.md`, when present.
- `GLOSSARY.md` or `GLOSSARY-MAP.md`, legacy `CONTEXT.md` or `CONTEXT-MAP.md`, relevant ADRs, existing game workflow guidance, and local tracker conventions such as `.scratch/`.
- Whether a triage workflow is actually installed or used before considering its label mapping.

When game-work rules are in scope, read the relevant sections of [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md). Treat it as shared guidance, not a project decision or permission to act. Read only the templates needed to fill a real gap: [GitHub tracker](./issue-tracker-github.md), [GitLab tracker](./issue-tracker-gitlab.md), [local tracker](./issue-tracker-local.md), [triage labels](./triage-labels.md), and [domain guidance](./domain.md).

## 2. Reuse settled choices

Compare the existing tracker, exact label strings, domain-doc layout, effective instruction target, and game-work rules with the requested setup. Keep configured conventions and unrelated user content. Skip complete, consistent choices. Do not reset files or replace a working tracker because a template has a different default.

If triage is not installed or used, omit its label setup. If the current instructions already identify the effective target and required guidance, update only the missing part. Do not copy engine versions, current open maps, Editor ownership, unsaved state, or other transient observations into permanent instructions.

## 3. Resolve only material gaps

For an unset tracker, infer GitHub or GitLab from the repository remote; otherwise reuse local evidence and discuss only an unresolved choice among GitHub, GitLab, local markdown, or the user's existing workflow. Preserve the configured PR/MR request-surface flag. For a new GitHub or GitLab setup, leave that flag off unless the project already uses or the user explicitly requests PR triage.

Verify the exact GitHub or GitLab target is reachable with a read-only `gh repo view <owner/repo>` or `glab repo view <owner/repo>`. If its identity or access is unresolved, report the gap before drafting it as a working tracker. Propose any missing remote configuration or tracker labels as separate setup actions; this documentation-only workflow does not create them.

If a triage workflow is used and its mapping is missing, offer the five canonical roles, `needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`, and `wontfix`, as the default mapping. Ask once whether to keep those names; collect the tracker's exact existing strings only if the user declines. This documents the mapping and does not create tracker labels. Preserve every existing mapped string and add no status vocabulary.

Default to single-context `GLOSSARY.md` and `docs/adr/`. Offer a multi-context layout only when repository discovery finds real monorepo signals, and preserve the existing layout when it is already settled. Resolve any remaining choices one at a time, skipping settled decisions.

If legacy `CONTEXT.md` or `CONTEXT-MAP.md` files exist, propose migration to their `GLOSSARY` names with matching updates to `docs/agents/domain.md`. Do not move files in this documentation-only workflow or write pointers to a migration that has not happened; report the separately authorized migration still needed.

For game-project rules, summarize applicable instructions, prior decisions, and known constraints first. Discuss only unresolved or conflicting choices that materially affect the workflow, such as:

- Editor ownership and coordination for live changes.
- Authorized maps, assets, protected content, and shared dependencies.
- Saving, recovery, and how to handle ambiguous results.
- Technical verification versus creative acceptance and publication.

Confirm what the project is before drafting rules; a repo name only supports a guess. If it is not a game (reverse engineering, tooling, research), skip the game guide, Editor, and creative-acceptance rules and draft rules for the project's real risks instead. For reverse-engineering projects, start from [references/reverse-engineering-rules.md](./references/reverse-engineering-rules.md). Ask for the concrete target scope (subsystem, asset or data type), not just the category, and record it as an in-scope sentence plus "other systems out of scope unless needed to locate, load, or decode the target". Users usually care about one narrow slice, and a broad purpose line invites unbounded investigation.

Use the shared guide as a comparison point, not a reason to repeat settled rules or conduct an exhaustive questionnaire. Give a practical recommendation for each real choice and preserve standing authorization. If an unresolved question needs an interview, verify and load the unchanged `grilling` helper through the current harness's skill-loading tool. If a game-domain term or decision needs resolution, verify and load `gd-domain-modeling` separately. Load one skill per tool call, follow its method, and return here with the decision. Do not delegate the whole setup to another setup skill.

## 4. Draft the complete changes

Use `docs/agents/issue-tracker.md`, `docs/agents/triage-labels.md` when triage is used, and `docs/agents/domain.md` for the existing tracker, label, and domain guidance layout. Record game-work rules in the effective project instruction file or closest suitable existing reference; do not introduce a mandatory document tree. Identify the instruction file the active harness actually reads. If none applies, recommend `AGENTS.md` as the draft target. Update an existing `## Agent skills` block in place; preserve everything around it. Include tracker, triage-label, or domain pointers only when the corresponding guidance will exist and be used.

Show one consolidated draft of every file or section to add or change, including the exact effective instruction target. Reuse the linked templates as seeds and adjust only references needed to match the skills actually installed. Keep existing flags, labels, directory layout, and unrelated text. When a drafted rule depends on repository configuration (for example, a rule that game data stays in a gitignored folder), name the concrete path in the rule and offer the config file (such as `.gitignore`) in the same draft as a separately confirmable item. A rule that points at an ignore rule that doesn't exist yet is a leak waiting to happen. Let the user revise the draft. Obtain confirmation for that draft once; do not ask again for a choice already settled in the same flow.

## 5. Write and verify

After confirmation, write only the approved documentation. Preserve surrounding content and avoid duplicate sections. Read each changed file back, verify the intended block and conventions, and follow every newly written project-document link to confirm it resolves. For an ignore file, prove it with `git check-ignore -q --no-index <path>` on sample paths that must be ignored and on paths that must stay tracked (instruction files, `docs/`, `.scratch/`). Report files changed, choices preserved, unresolved items, and verification results.

## Done

The setup is complete when confirmed guidance is written without disturbing settled configuration, and every changed file and local link has been read back and checked. This skill does not perform the game work it documents.