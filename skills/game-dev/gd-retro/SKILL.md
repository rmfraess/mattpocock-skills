---
name: gd-retro
description: Use when reviewing a game-dev session retrospectively.
disable-model-invocation: true
---

# GD Retro

The user has requested a retrospective. Propose evidence-backed improvements to the game-development workflow and its environment. This skill is a proposal pass; do not edit project or profile instructions, install tools, or implement guardrails.

## Steps

1. Call the Skill tool for `writing-for-agents` in its own skill-loading call, then follow its guidance for the proposals.
2. Read primary sources for the specified session, such as session logs, relevant diffs, tool results, captures, and saved-state checks. If no session is specified, use the current one. Redact sensitive information in any quoted evidence.
3. When the session involved a live Editor, map or asset writes, saves, retries, ownership, or acceptance, read the relevant parts of [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md) and the project's effective instructions. Check whether an existing rule already covers the observed problem.
4. Look for evidenced opportunities in the following areas:

   - **Game outcome:** relevant saved map or asset results, references, play/build evidence, performance conditions, and the actual technical or creative acceptance state.
   - **Execution path:** wrong-target or missing preflight, Editor ownership conflicts, unsafe saves, ambiguous retries, and manual repair or intervention. Recommend prevention at the point before mutation when the evidence supports it.
   - **Automated checks:** inspect existing check commands and their hook/CI wiring first. If a relevant mechanical risk lacks an effective guardrail, report the gap. Prefer the smallest supported deterministic check over more prose; do not add a new collector or benchmark for every session.
   - **Navigation and information access:** missing project pointers or unavailable read-only evidence that materially slowed the work, including oversized steering files that obscure the right guidance.
   - **Review and standards:** distinguish reviewer judgment or style rules from execution-time safeguards. A reviewer-only rule cannot prevent a wrong target or unsafe save before it occurs.
   - **Tool economy and no-ops:** streamline an observed expensive call or remove steering that demonstrably does not change behavior.

   Use tool-call, retry, or elapsed-time data only when it was recorded and matters to the finding. Do not invent totals or require timed measurements. A serious observed safety gap can justify prevention without waiting for recurrence. If an adequate existing rule was ignored, report a compliance or enforcement problem rather than duplicating the rule.
5. Present prioritized proposals with the observed evidence, expected benefit, implementation location, and practical cost or limitation. Prefer an existing execution path or closest project guide, and leave sound instructions unchanged. Do not turn isolated tool hiccups or speculative possibilities into new standing policy.

Writing a retrospective does not authorize implementation. Keep proposed edits separate from any later approved changes.