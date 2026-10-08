---
name: gd-handoff
description: Use when writing a game-development session handoff.
argument-hint: "What should the next session continue?"
disable-model-invocation: true
---

# GD Handoff

Write a concise handoff document for the next session at the user-agreed location under `D:\temp`, not in the current workspace. Use a dated, collision-safe filename and do not overwrite an earlier handoff. This is a portability aid, not mandatory paperwork at every pause.

Use the supplied focus to decide what context matters. Reference existing specs, plans, ADRs, issues, commits, diffs, and evidence by path or URL instead of duplicating them. Include a suggested-skills section with relevant skill names for the next agent to load.

## Record state accurately

For relevant project, map, asset, and Editor state, distinguish:

- **Saved and verified:** what persisted result was checked, how it was checked, and when.
- **Observed live state:** what was visible in the connected Editor or checkout and when it was observed. This is a dated observation, not proof that the state stayed unchanged.
- **Unsaved, uncertain, or unknown:** what was not saved, not inspected, or could not be verified. Do not infer persistence from a successful tool response.

Identify the actual project or checkout and relevant targets only when they help the next session. Reuse existing evidence and permitted read-only checks; do not require a new full-project audit. Include task-owned targets touched, outstanding failures or unverified results, evidence pointers, relevant approval boundaries, and the next authorized action or authorization still needed. Do not create a checkpoint or commit solely to write the handoff.

## Keep resumption state-aware

The next agent must reconcile these observations with the current checkout, relevant dirty state, map/assets, and Editor ownership before acting. The handoff does not prove that the project is unchanged, grant permission, transfer ownership, or act as a lock.

Writing the handoff does not save or switch maps, clean up project state, execute pending work, or transfer Editor ownership. Preserve unrelated unsaved work. For live Unreal or asset details, keep the relevant rules in [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md) and the project's effective instructions; record transient state here rather than copying permanent rules.

Redact secrets and sensitive personal information. Verify that the document was written to the exact agreed `D:\temp` destination.