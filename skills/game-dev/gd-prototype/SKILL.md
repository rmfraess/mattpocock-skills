---
name: gd-prototype
description: Use when testing a game-design question with a prototype.
---

# GD Prototype

A prototype answers one design question with the cheapest experiment that preserves the behavior being judged.

## Choose the experiment

Start from the user's question and existing project context. Before building, state the question, minimum fidelity, how the result will be observed, and what finding will end the experiment. Reuse supplied decisions and ask only when a missing choice would change the experiment.

Choose the format that retains the load-bearing behavior:

- Use a small executable rules harness for isolated rules or state transitions.
- Use an Unreal test map or repeatable play scenario when gameplay, camera, physics, input, timing, or engine behavior matters.
- Use a blockout or playable route for scale, navigation, pacing, or composition.
- Use a focused Blender or Unreal asset experiment when an asset's shape, material, animation, or integration is the question.
- Use a representative performance scene and measurement when cost or frame time is the question.
- Keep an HTML or browser prototype when it is the simplest faithful way to judge the requested behavior or interface. Read [LOGIC.md](LOGIC.md) or [UI.md](UI.md) for those branches.

A quick substitute that omits the behavior under question is not a useful experiment. Do not add a separate spec, ticket, or approval ceremony for a small prototype.

## Bound the work

Mark prototypes clearly and place scratch maps, assets, code, and captures in authorized scratch targets separate from approved production targets. Read project instructions and version-appropriate engine guidance before using editor-specific operations. For live Unreal Editor or asset work, follow the relevant sections of [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md): use the one running Editor under its assigned owner, verify the live project, and preserve unrelated unsaved work. Do not open another Editor instance.

Build only enough to answer the question. Use checks and error handling when needed to prevent damage or make the observation trustworthy; do not add production polish, a full test suite, or abstractions without a present need.

Save a map, asset, or other output when persistence is needed to replay or compare the experiment and the existing scope permits the save. Record the prototype identity and relevant saved result. A saved prototype is not approval to promote it into production.

## Observe and hand off

Run or demonstrate the experiment under the stated conditions. Make the relevant state and result observable after each meaningful action. Record the question, setup, relevant configuration, evidence, observed result, and anything still uncertain. For performance, use an approved target when one exists; otherwise report a comparable baseline or an unresolved target, never an invented pass threshold.

Let the user determine creative or game-feel acceptance. Record their verdict and the question it settles in the agreed artifact when existing authorization covers that update. Preserve a runnable prototype as primary evidence using the project's existing practice and authorization, and leave a context pointer from the implementation task when useful. Do not adopt prototype code or assets into production here. Production implementation is a separate task with its own scope.