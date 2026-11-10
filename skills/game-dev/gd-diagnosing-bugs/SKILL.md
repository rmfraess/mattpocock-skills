---
name: gd-diagnosing-bugs
description: Use when diagnosing game bugs or performance regressions.
---

# GD Diagnosing Bugs

Use this workflow when diagnosis is requested or the issue needs a full investigation. Select the work proportionally, but keep the phase gates once selected. A quick explanation of a known failure does not automatically require the full workflow.

Read `GLOSSARY.md` when present and relevant ADRs before changing the affected area. For live Editor, saved-content, or asset operations, follow the applicable scope, ownership, save, and retry rules in [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md).

## Start with the outcome and severity

1. Explain the exact player-visible symptom in plain language, then separate what is observed, what is causally established, and what remains unknown; subsystem jargon alone does not tell the user what is wrong.
2. Judge its significance in representative, normal-scale views against the current task's acceptance criteria before escalating diagnosis. Enlarged crops establish visibility, not acceptance-blocking severity. Keep later art, traversal and performance requirements with their own work.
3. After an ineffective probe, identify the decision another probe would change before requesting it. Prefer discriminating evidence over another nearby setting value; partial improvement is not a reason for an open-ended tuning loop. Carry forward which hypotheses were supported, ruled out or left confounded so each continuation resolves a new uncertainty rather than repeating tint, density or lighting variants. Separate ingredient quality from application: similar failures across several textures do not establish that every asset is unsuitable; inspect shared projection, coverage, supporting shape and shading before recommending another acquisition. If a switch exposes a contribution but leaves the player-visible symptom, report the contribution and keep the fix unselected; an untested replacement ingredient remains a trial proposal, not the next proven solution.
4. When the creative owner accepts the scoped result and applicable technical checks leave no material gap, record the unresolved symptom as non-blocking and stop the investigation. Preserve the evidence without claiming a root cause or fix; complete the accepted task rather than letting optional pixel cleanup dominate progress.

## Redact and reuse evidence

Redact secrets before showing commands, outputs, logs, or captures. Inspect supplied reproduction commands, tests, and evidence before building a new loop. Credit only criteria that the evidence actually demonstrates and that remain applicable. Attribute reused evidence; do not claim personal execution. A summary or proposed diagnosis is a lead, not proof.

A reproduction demonstrates the symptom, not its cause. Causal work counts only when a falsifiable prediction and a discriminating observed result support the cause over alternatives. Validate the experiment's controls before interpreting its result: an uncommanded camera or scene change invalidates a paired rendering comparison, even if the tool succeeded. Keep numerical collision/contact passes separate from visible surface correctness. Never replay a prohibited, destructive, or consumed operation just to satisfy a phase. Use a permitted equivalent that tests the same condition or report the verification boundary.

## Phase 1: Build a faithful feedback loop

Spend effort on the fastest practical loop that still exercises the behavior that failed. Tighten setup and remove irrelevant work, but do not replace load-bearing engine, asset, timing, or player behavior with a faster test that cannot fail on the reported bug. A trustworthy loop is not disqualified because a real map load or manual interaction takes minutes.

Choose an available form that fits the failure:

1. A failing test at a seam that reaches the bug.
2. A repeatable engine-native test map, play scenario, or input sequence.
3. An asset-load, save, or reference check when content state is involved.
4. A profiler capture or comparable measurement for a performance regression.
5. A CLI, HTTP, headless-browser, trace-replay, focused harness, property, bisection, or differential loop when it faithfully reaches the failing behavior.
6. A recorded manual procedure when native interaction cannot be scripted. State the starting/reset state, relevant configuration, actions, expected result, actual observation, and captured evidence. The optional [HITL loop template](scripts/hitl-loop.template.sh) can structure prompts and capture values when it fits; Bash is not a qualification requirement.

Demonstrate the failure at least once through an authorized run or applicable supplied evidence. A proposed procedure without an observed failure is not a completed reproduction. The loop must distinguish the user's exact symptom from nearby failures and preserve the conditions needed to trigger it. Tighten speed, signal, and repeatability as far as possible without removing the trigger.

For intermittent bugs, record attempts, failures, and relevant conditions when observed. A single clean run does not establish a fix. Use a useful observed recurrence or agreed acceptance condition; do not invent a universal failure-rate threshold or parallelize operations that compete for the same live project or Editor.

If no faithful loop can be built, state what was tried and what permitted evidence, access, or instrumentation is missing. Request the minimum needed from the user, such as a redacted capture or authorized access. Do not proceed to causal hypotheses without an observed reproduction or applicable evidence that satisfies the phase.

## Phase 2: Reproduce and minimize

Run the loop unless applicable evidence already meets the criteria. Confirm that it produces the user's reported failure, capture the exact symptom and relevant build/plugin/map/input or measurement conditions, and repeat it enough to understand variability.

Reduce the scenario one element at a time, rerunning after each change. Keep every input, asset, setting, action, and timing condition that is load-bearing. For a native test crash, first locate the failing phase from the saved stack and inspected engine source: fixture construction, the operation under test, or its assertion/Undo cleanup. Trace indexed allocations to their backing storage before another build; an engine frame does not establish an engine defect when the fixture supplied inconsistent data. Preserve the existing failure as the reproduction rather than consuming another retry just to rediscover it. A minimized reproduction is complete when removing any remaining element makes the observed failure disappear. Do not proceed until permitted runs or applicable existing evidence demonstrate the reproduction and minimization.

## Phase 3: Hypothesize

For unresolved causes, list 3 to 5 ranked, falsifiable hypotheses before testing them. State the prediction each makes, for example: "If X is the cause, changing Y should remove the failure, while changing Z should worsen it." Show the ranking to the user before testing; proceed with the stated ranking if they are unavailable. Credit already demonstrated causal evidence rather than repeating it.

## Phase 4: Probe

Map each probe to a prediction and change one variable at a time. Choose the smallest discriminating batch within the existing authorization; restore each variable before the next probe. A scoped diagnostic approval covers that batch, not a production fix or new probes outside its boundary.

For session-only Unreal CVar probes, use native `unreal.SystemLibrary.execute_console_command(world, command)`; snapshot and read back values, restore them in `finally`, then verify config hashes and dirty packages. Finish a run journal as successful only after restoration checks pass; on exceptions preserve failure evidence and cleanup status.

For deformed terrain that resembles a road berm or snowbank, first match the reported camera and trace the visible surface to its actual component. Compare composite heights with a temporary base-only view by toggling only the suspected edit layer through `get_edit_layers_bp()`/its `visible` property, calling the target Landscape's `force_layers_full_update()`, and reading back in a later call. Restore the original layer visibility and verify the complete composite before proceeding; a spike unchanged with the road layer disabled is not evidence for changing spline grades. Scan the full affected detail grid for the same narrow outlier pattern, using neighboring clean cross-sections and actual collision to distinguish corruption from natural slopes. Do not classify every steep mountain as another occurrence. For an authorized repair, modify only proven outlier cells in the authored base layer, preserve paint/route/scale and unaffected cells, then explicitly regenerate dependent dressing and verify grounding, same-camera appearance and cold persistence. State the original introducing operation as unknown unless separate evidence establishes it.

For rendered artifacts, follow [rendering diagnostics](references/rendering-diagnostics.md) for paired captures, contribution-versus-fix claims, and image-delta checks. Prefer a debugger or REPL, then targeted boundary logs. Tag temporary logs with a unique prefix and remove them in cleanup. For performance, measure a relevant baseline before changing the implementation, and preserve comparable build, scene, workload, and hardware conditions where available. Measure the workload the user described: lag "while moving" needs a moving-camera loop, not an idle reading. For Unreal Editor/viewport lag, follow [editor performance](references/editor-performance.md) and its [flythrough probe](scripts/editor_flythrough.py).

To trace when a saved Unreal setting changed without Editor access, read each revision's real package bytes with `git cat-file --filters <rev>:<path>` (it resolves LFS pointers), grep the text diffs of scripts and source for the property, and grep the package name table for property/enum names (for example a StaticMesh with no `AggGeom`/`*Elems` entries has no simple collision shapes). The name table shows that a name is present somewhere in the package, not the value on a specific object, so report a conclusion drawn from it as likely (not tested) until a live readback confirms it.

Independent investigations may run in parallel using saved snapshots, isolated code/tests, or offline outputs. Give each a bounded hypothesis and separate write scope; compare its actual evidence with the prediction. Route live reproduction, instrumentation, and saves through the one Editor owner, and avoid competing workloads that invalidate a measurement.

## Phase 5: Fix and regress

Write a regression check before the fix when a seam exercises the real failure path. Watch it fail, apply the fix, watch it pass, then rerun the Phase 1 loop against the original scenario. If no correct seam exists, document that limitation instead of adding a misleading shallow test. Use the evidence appropriate to the bug; do not claim an engine or saved-content check that was not run.

If you force red by deliberately mutating code or a fixture, compare it with the pristine baseline to prove the mutation landed before trusting the failure. For binary assets or Editor state, use an appropriate semantic or state comparison under the existing ownership and recovery rules, not an assumed text diff.

## Phase 6: Clean up and report

For diagnosis-only work, deliver the scoped observed result, supported causal contribution or remaining uncertainty, and the exact decision needed before dependent changes. For a fix, rerun the original scenario and report regression evidence or the missing-seam limitation before claiming resolution. A reduction in the symptom is not a fix. Remove temporary instrumentation, restore diagnostic state, and delete or clearly mark throwaway artifacts. State the supported hypothesis and evidence concisely; keep detailed probe records in the existing task evidence rather than expanding the user-facing report. Report failed, unavailable, and unverified checks plainly.