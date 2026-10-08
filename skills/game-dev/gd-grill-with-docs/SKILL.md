---
name: gd-grill-with-docs
description: Use when clarifying game design and updating project docs.
disable-model-invocation: true
---

Load and follow `grilling`, then `gd-domain-modeling`, through separate calls with the host's skill-loading capability. Verify the GD helper is available first. If it is missing, use `grilling` for discussion, skip game-domain documentation updates, and report the missing dependency. Do not substitute base `domain-modeling`.

Ask only about player intent, approved references, constraints, interaction, camera, scale, composition, or performance when they matter to the current decision. Reuse settled direction. `grilling` owns question rounds, user decisions, and background fact gathering.

If feel or appearance needs an experiment, name the question and smallest useful playable or visual test, then route to `gd-prototype` only when available. If it is missing, report the experiment route as blocked instead of substituting another workflow. Discussion does not authorize Editor mutations; use existing authorization or hand off for the user's choice.

Record approved terms and decisions with useful reference or evidence pointers in existing project docs. Mark tentative ideas as assumptions. Keep the glossary out of specs and transcripts, create no document for every choice, and preserve the existing external transcript/archive convention. For relevant Unreal project, Editor, map, asset, saving, or acceptance rules, read [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md).