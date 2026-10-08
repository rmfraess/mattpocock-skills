# Game-development working guidance

Use only the sections relevant to the current task. Read the project's effective instructions, approved direction, and engine-operation guide first. This reference supplies common workflow rules, not a replacement for project decisions or permission to start work.

## Scope and live target

Reuse the agreed outcome, authorized files/maps/assets, protected content, required checks, and existing approval policy. Resolve missing or conflicting scope before the affected action; keep unrelated work intact. Find engine/tool versions in authoritative project configuration and the live environment rather than caching them here. Use target-version official documentation and locally verified tool support for engine operations; documented capability is not proof that the connected integration supports it.

Before live operations, establish the connected Editor's actual project and checkout, relevant map/asset identities, and unsaved state. A worker's Git worktree does not redirect that Editor. Map/asset identifiers locate the intended target, but dated observations must be reconciled against current state.

## One live Editor owner

Plan around one running Unreal Editor for this workflow. Exclusive ownership is the chosen coordination policy, not a claim that the engine forbids multiple automation clients.

- One assigned worker owns a bounded inspect/change/save/verify segment, including Editor commands, direct writes to its active project's assets, saves, and reloads. Ownership spans the segment rather than individual calls.
- Declare write targets, outputs, and relevant shared dependencies before dispatch. Serialize overlapping or uncertain write scopes. Different tickets, actor names, or branches do not establish isolation.
- Keep research, saved-snapshot inspection, isolated code/tests, and offline asset preparation parallel where genuinely independent. These workers neither control the live Editor nor write into its active Content tree or trigger reloads. Coordinate their integration and live checks with the owner.
- Transfer ownership after relevant task-owned changes are saved and verified. The next owner reconciles current state. Keep this in existing assignments and dispatch decisions, not a new scheduler or lock service.

Resource availability is separate from task dependencies and triage readiness. An otherwise specified task may await Editor access; do not invent dependency edges or new labels merely to serialize that access. Performance measurements must also account for competing work on shared resources.

## Save, recover, and integrate

Use an appropriate existing checkpoint or a task-scoped recovery point. Preserve unrelated unsaved work and save only authorized, task-owned changes. A successful tool response does not prove that the intended assets exist or that their saved state is correct. Inspect the persisted result and relevant references before claiming completion.

After a timeout or ambiguous result, inspect what actually happened before retrying. Complete only reconciled missing work within existing retry limits, or report the unresolved state. Keep Editor ownership through that reconciliation; blind replay may duplicate content.

Coordinate merges and file replacements affecting the live checkout with its owner. For conflicting binary assets, apply an existing authorized resolution plan or pause that integration for a plan. Verify resulting saved assets and references; silently choosing a branch's version is not evidence that the combined outcome survived. Preserve dirty work and remove only safe, run-owned worktrees under the existing cleanup policy.

## Evidence and acceptance

Choose evidence that answers the requirement:

- Code behavior: required compilation, automated tests, and faithful integration scenarios.
- Content operations: saved-asset/map checks, target inventory, and reference checks.
- Appearance and feel: comparable captures or playable assessment plus the user's verdict.
- Performance: comparable measurements with build, scene, hardware, and relevant workload conditions.

Mixed tasks need the relevant combination. Preserve required checks; report unavailable or failed checks as such. Use agreed performance targets, or record the unresolved target instead of inventing one. A screenshot does not prove persistence, a test pass does not approve appearance, and favorable technical review does not grant creative acceptance.

## Workflow boundaries

Keep investigation, provisional experiments, agreed direction, production implementation, technical review, creative acceptance, and publication distinct. Reuse standing authorization and existing task/project gates; avoid repeated approval prompts for already authorized steps. A prototype verdict is not permission to adopt its code/assets into production. Integration, PR readiness, and tracker closure remain separate outcomes.

Keep durable rules and approved decisions in the project's existing instructions or closest reference. Keep current Editor ownership, open maps, dirty state, and other transient observations in dated task/handoff evidence rather than permanent setup guidance. Verify required skills are actually available before enabling their routes; report a missing dependency rather than substituting conflicting base behavior.
