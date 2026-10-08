---
name: gd-diagnosing-bugs
description: Use when diagnosing game bugs or performance regressions.
---

# GD Diagnosing Bugs

Use this workflow when diagnosis is requested or the issue needs a full investigation. Select the work proportionally, but keep the phase gates once selected. A quick explanation of a known failure does not automatically require the full workflow.

Read `GLOSSARY.md` when present and relevant ADRs before changing the affected area. For live Editor, saved-content, or asset operations, follow the applicable scope, ownership, save, and retry rules in [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md).

## Redact and reuse evidence

Redact secrets before showing commands, outputs, logs, or captures. Inspect supplied reproduction commands, tests, and evidence before building a new loop. Credit only criteria that the evidence actually demonstrates and that remain applicable. Attribute reused evidence; do not claim personal execution. A summary or proposed diagnosis is a lead, not proof.

A reproduction demonstrates the symptom, not its cause. Causal work counts only when a falsifiable prediction and a discriminating observed result support the cause over alternatives. Never replay a prohibited, destructive, or consumed operation just to satisfy a phase. Use a permitted equivalent that tests the same condition or report the verification boundary.

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

Reduce the scenario one element at a time, rerunning after each change. Keep every input, asset, setting, action, and timing condition that is load-bearing. A minimized reproduction is complete when removing any remaining element makes the observed failure disappear. Do not proceed until permitted runs or applicable existing evidence demonstrate the reproduction and minimization.

## Phase 3: Hypothesize

For unresolved causes, list 3 to 5 ranked, falsifiable hypotheses before testing them. State the prediction each makes, for example: "If X is the cause, changing Y should remove the failure, while changing Z should worsen it." Show the ranking to the user before testing; proceed with the stated ranking if they are unavailable. Credit already demonstrated causal evidence rather than repeating it.

## Phase 4: Probe

Map each probe to a prediction and change one variable at a time. Prefer a debugger or REPL, then targeted boundary logs. Tag temporary logs with a unique prefix and remove them in cleanup. For performance, measure a relevant baseline before changing the implementation, and preserve comparable build, scene, workload, and hardware conditions where available.

Independent investigations may run in parallel using saved snapshots, isolated code/tests, or offline outputs. Give each a bounded hypothesis and separate write scope; compare its actual evidence with the prediction. Route live reproduction, instrumentation, and saves through the one Editor owner, and avoid competing workloads that invalidate a measurement.

## Phase 5: Fix and regress

Write a regression check before the fix when a seam exercises the real failure path. Watch it fail, apply the fix, watch it pass, then rerun the Phase 1 loop against the original scenario. If no correct seam exists, document that limitation instead of adding a misleading shallow test. Use the evidence appropriate to the bug; do not claim an engine or saved-content check that was not run.

## Phase 6: Clean up and report

Before declaring the diagnosis complete, verify the original scenario no longer reproduces, report regression evidence or the missing-seam limitation, remove temporary instrumentation, and delete or clearly mark throwaway artifacts. State the supported causal hypothesis and its evidence in the handoff or change summary. Report failed, unavailable, and unverified checks plainly.