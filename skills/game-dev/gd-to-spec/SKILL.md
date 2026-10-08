---
name: gd-to-spec
description: Use when turning agreed game work into a project spec.
disable-model-invocation: true
---

Synthesize the current conversation and relevant project state into a spec. Do not restart the interview.

If the tracker or configured triage-label vocabulary is missing, resolve the project's existing convention before publication. Do not invent a replacement.

## Process

1. **Gather context.** Read the relevant project instructions, domain glossary, and ADRs. Explore the current project state when it affects the spec. For Unreal maps, assets, Editor work, saving, or game-specific acceptance, read the relevant sections of [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md) from this skill bucket. Reuse approved creative direction, references, authorized scope, protected content, agreed validation, and existing approval rules. Distinguish established facts from provisional assumptions and approved decisions.

2. **Set validation choices.** Reuse agreed testing and acceptance choices. If a material choice is missing or has changed, surface that choice and get agreement before finalizing. Choose evidence that can establish the requested result, not just the easiest code seam.

3. **Write the spec** using the template below. User stories clarify player-visible outcomes when useful; do not pad content, architecture, or refactoring work with stories that add no meaning. Avoid speculative implementation paths. A verified map or asset identifier may define authorized scope. A prototype snippet may be included only when it states a decision more precisely than prose, with a note that it came from the prototype.

4. **Publish only when authorized.** A request limited to drafting or review does not authorize publication. A direct `/gd-to-spec` invocation or explicit request to publish does. If the tracker, parent, or publication target is unresolved, clarify before publishing. Apply the configured `ready-for-agent` triage label, with no additional triage. The published parent spec remains the completeness anchor for child implementation tickets. Read back and verify the published body and mapped labels, then return the issue link. Report any failed verification. A written or published spec does not authorize Editor mutations or prove execution blockers are resolved.

<spec-template>

## Problem Statement

The problem the user is facing, from the user's perspective.

## Solution

The agreed solution, from the user's perspective.

## User Stories

Include a proportional numbered list only where stories clarify player-visible outcomes. Cover the agreed scope without duplication. For architecture, content production, or refactoring, use concrete outcomes and invariants instead of forced stories.

1. As a <player or other actor>, I want <outcome>, so that <benefit>.

## Implementation Decisions

Record agreed decisions, such as relevant modules or interfaces, architecture, schema, interactions, approved creative direction or references, protected content, and verified map or asset identifiers when they define authorized scope. Mark assumptions as provisional. Include applicable performance conditions and agreed targets; if a target is missing, state the unresolved requirement rather than inventing a threshold. Do not include speculative implementation file paths or stale code detail.

## Testing Decisions

Choose the relevant combination of:

- Behavioral tests and in-engine scenarios.
- Saved map or asset checks and reference checks.
- Comparable visual captures or playable assessment with human judgment.
- Performance measurements with relevant conditions.

State the behavior or result each check establishes, which parts of the project are in scope, and the agreed acceptance owner for technical and creative judgments. Preserve required project checks and reuse approved validation. A test pass does not approve appearance, and a favorable visual review does not prove saved state.

## Out of Scope

Describe work excluded from this spec.

## Further Notes

Keep these distinct:

- **Unresolved decisions:** open creative questions or other choices that still need an answer.
- **Execution blockers:** actual missing access, resources, tools, or prerequisites.
- **Provisional assumptions:** facts or direction used temporarily, not approved decisions.

</spec-template>