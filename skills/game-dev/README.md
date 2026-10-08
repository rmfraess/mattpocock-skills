# Game-development skills

Additive derivatives of the current Matt Pocock fork. Original skills and supporting guides remain unchanged. These packages implement the individually approved game-development scopes, not every suggestion in the original extension report.

## Skills and provenance

The source column identifies the original package relative to `skills/`. The declared invocation mode is preserved from that package; hosts interpret invocation metadata differently, so it is not a universal runtime permission boundary. Every package includes its own `agents/openai.yaml` adapter.

| Skill | Base package | Declared invocation |
| --- | --- | --- |
| [gd-implement-spec](gd-implement-spec/SKILL.md) | `engineering/implement-spec` | User |
| [gd-implement](gd-implement/SKILL.md) | `engineering/implement` | User |
| [gd-prototype](gd-prototype/SKILL.md) | `engineering/prototype` | Model or user |
| [gd-to-spec](gd-to-spec/SKILL.md) | `engineering/to-spec` | User |
| [gd-to-tickets](gd-to-tickets/SKILL.md) | `engineering/to-tickets` | User |
| [gd-tdd](gd-tdd/SKILL.md) | `engineering/tdd` | Model or user |
| [gd-code-review](gd-code-review/SKILL.md) | `engineering/code-review` | Model or user |
| [gd-pr](gd-pr/SKILL.md) | `engineering/pr` | Model or user |
| [gd-wayfinder](gd-wayfinder/SKILL.md) | `engineering/wayfinder` | User |
| [gd-grill-with-docs](gd-grill-with-docs/SKILL.md) | `engineering/grill-with-docs` | User |
| [gd-grill-me](gd-grill-me/SKILL.md) | `productivity/grill-me` | User |
| [gd-domain-modeling](gd-domain-modeling/SKILL.md) | `engineering/domain-modeling` | Model or user |
| [gd-codebase-design](gd-codebase-design/SKILL.md) | `engineering/codebase-design` | Model or user |
| [gd-improve-codebase-architecture](gd-improve-codebase-architecture/SKILL.md) | `engineering/improve-codebase-architecture` | User |
| [gd-diagnosing-bugs](gd-diagnosing-bugs/SKILL.md) | `engineering/diagnosing-bugs` | Model or user |
| [gd-handoff](gd-handoff/SKILL.md) | `productivity/session-handoff` | User |
| [gd-retro](gd-retro/SKILL.md) | `engineering/retro` | User |
| [gd-setup-matt-pocock-skills](gd-setup-matt-pocock-skills/SKILL.md) | `engineering/setup-matt-pocock-skills` | User |
| [gd-ask-matt](gd-ask-matt/SKILL.md) | `engineering/ask-matt` | User |
| [gd-triage](gd-triage/SKILL.md) | `engineering/triage` | User |

Reuse `research` and `writing-for-agents` unchanged. No `gd-research`, `gd-writing-for-agents`, or separate `gd-setup-project-rules` package is included. The combined `gd-setup-matt-pocock-skills` owns both missing engineering setup and guided game-project rule definition.

## Shared guidance and dependencies

For live Editor work, content changes, integration, or evidence selection, read [GAME-DEVELOPMENT.md](GAME-DEVELOPMENT.md). It is a plain shared reference, not another command. Its one-running-Editor policy permits isolated parallel preparation while assigning one owner to each live inspect/change/save/verify segment. Apply only the rules relevant to the task.

Use the complete `game-dev/` bucket together so each package's `../GAME-DEVELOPMENT.md` pointer resolves. Read that plain reference with a file-reading capability relative to the resolved package location; it is outside an individual package's support-file boundary. Standalone raw-SKILL-URL installation is not promised. Compatible base helpers named by a workflow must also be available. Load called skills individually through the host's skill-loading tool and verify availability before starting a dependent phase.

Changed method-specific support files are owned by their derivative packages. Their conditional pointers keep unrelated branches out of the initial load. Verified asset/map identifiers locate task targets; fixed project versions, current open maps, dirty state, and active ownership are discovered at use rather than frozen into this collection.

## Boundaries

The router recommends a next skill and stops. Setup preserves settled tracker, labels, domain documentation, and rules; only missing or conflicting choices need discussion and a confirmed documentation draft. Investigation and prototypes do not grant production-edit permission. Technical verification, creative acceptance, and publication remain separate.

Adding this source bucket does not install it into any profile, change runtime approvals, launch an Editor, publish issues, or update parent submodule pins. The base engineering router and plugin catalogs remain unchanged; this bucket is not added to the source's promoted engineering/productivity plugin set.

## Attribution and maintenance

Derived from `rmfraess/mattpocock-skills` at `f982b24d1d0f632784d0badf8d7b2244bf307db8`, originally authored by Matt Pocock and contributors. The new additive scopes were approved by Ronald Fraess; derivative implementation is by Hermes Agent (Nous Research). Keep bases and GD variants distinct and manually review future source changes against the accepted scopes. Preserve original notices in copied support files.

The source MIT terms are retained verbatim in [LICENSE](LICENSE).
