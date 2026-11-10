---
name: gd-handoff
description: Use when writing a game-development session handoff.
argument-hint: "What should the next session continue?"
disable-model-invocation: true
---

# GD Handoff

Write one concise handoff at the user's named destination. Otherwise put **session-resumption notes** in `D:\temp`, outside the project repo; put **durable subject/research deliverables** beside the relevant project briefs under the project's output convention. Distinguish these artifact types before choosing the path, so a temporary session note does not become repository clutter. Preserve earlier handoffs. Create a note when requested or useful for resumption, not as mandatory paperwork at every pause.

Use the recipient's next task to decide what context matters. Reference existing specs, plans, ADRs, issues, commits, diffs, and evidence by path or URL instead of duplicating them. Include relevant skills for the next agent to load.

For a research-to-image-review handoff: summarize the named story-state constraints with claim/evidence IDs and immediate citations; separate explicit facts, bounded inference, unknowns and later observations. Execute the included read-only SQL against the saved library, with support-review and temporal gates intact. List the exact reference-image paths, recorded camera directions, approval status and existing limitations. Give the recipient a short per-image return contract: observed discrepancy, supporting IDs, assessment and smallest proposed correction. Distinguish a requested review from authorization to regenerate or change an approved target; do not claim fresh visual acceptance from an existing README.

For a cross-project reference handoff, where another project consults this project's findings and does not continue its work, use this layout:
- Put the durable facts in a committed doc in the source repo, and put only the paste-ready prompt in `D:\temp`.
- The prompt gives the read order (facts doc first, then local artefacts, with how to measure them headless and which object or frame to use) and the source repo's commit.
- It states the boundaries: the source is read-only; asset-use or licence limits are stated whole rather than by pointer, because the recipient never loads the source project's rules; and new exports are requested back from the owner, not made by the recipient.
- It lists the traps that would mislead answers (misleading names, missing physics, unverified placements) and requires each answer to say whether a number came from the doc or a fresh measurement, and where it came from.

## Pause at a verified boundary

1. Honor a pause by stopping new investigation, implementation, imports and fan-out. Perform only the state-preservation work needed to resume; a pause is not another verification campaign. Treat delayed completions as status evidence, not permission to restart paused work.
2. Identify the last saved, verified deliverable and separate it from returned proposals, staged candidates and unresolved decisions. Leave unpublished work unpublished rather than rushing acceptance to manufacture a stopping point.
3. Check task-owned jobs and reviewers. Resolve or explicitly record any work that can still change the state; do not claim that nothing is running from an empty task ledger alone.
4. If resumption depends on prunable scratch, preserve the irreplaceable inputs/evidence and an existing verified baseline outside scratch before declaring the pause ready. Follow [pause preservation](references/pause-preservation.md) for archive selection, verification and restoration.
5. Save the smallest next authorized action and its remaining gates. End with a short status and the handoff path, not another research recap.

## Record state accurately

For relevant project, map, asset, and Editor state, distinguish:

- **Saved and verified:** what persisted result was checked, how it was checked, and when.
- **Observed live state:** what was visible in the connected Editor or checkout and when it was observed. This is a dated observation, not proof that the state stayed unchanged.
- **Unsaved, uncertain, or unknown:** what was not saved, not inspected, or could not be verified. Do not infer persistence from a successful tool response.

Identify the actual project or checkout and relevant targets only when they help the next session. Reuse existing evidence and permitted read-only checks; do not require a new full-project audit. Include task-owned targets touched, outstanding failures or unverified results, evidence pointers, relevant approval boundaries, and the next authorized action or authorization still needed. Do not create a commit or a new Editor/database checkpoint solely to write the handoff; reuse existing verified state and recovery evidence.

## Keep resumption state-aware

The next agent must reconcile these observations with the current checkout, relevant dirty state, map/assets, and Editor ownership before acting. The handoff does not prove that the project is unchanged, grant permission, transfer ownership, or act as a lock.

Writing the handoff does not save or switch maps, clean up project state, execute pending work, or transfer Editor ownership. Preserve unrelated unsaved work. For live Unreal or asset details, keep the relevant rules in [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md) and the project's effective instructions; record transient state here rather than copying permanent rules.

Redact secrets and sensitive personal information. Verify the exact destination, cited asset paths and executable retrieval examples before delivering the file.