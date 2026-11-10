---
name: gd-pr
description: Use when writing a game-development PR body.
disable-model-invocation: false
metadata:
  credits:
    skill: show-me
    author: Dex Horthy
    organisation: Humanlayer
    url: "https://github.com/humanlayer/skills/blob/main/plugins/show-me/skills/show-me/SKILL.md"
---

# Game-development PR body

Write the pull-request body only. Use the template's sections as a default, with brief prose and the smallest useful visual; preserve the author's established structure when it differs. Do not publish, merge, commit, push, run checks, or capture new evidence as a side effect of writing. Reuse applicable verified implementation or review evidence; state plainly when a comparison or check is unavailable or unverified. When the user asks only to state an unverified platform, do so in one line rather than proposing environment setup or extra work.

When preparing an upstream PR, inspect the author's recent PRs in that repository and follow their established section names and style when applicable; treat this skill's template as a default, not a reason to diverge. Preserve the agreed structure through later rewrites and verify the published body matches it.

When asked about repository PR requirements, inspect the target branch's contribution guidance and PR templates, then distinguish repository requirements from this skill's house template and recent-PR conventions. Never present the skill's headings as upstream rules; if none are found, say so.

Use the project's domain terms from `GLOSSARY.md` when it exists. For evidence involving Editor access, content changes, or acceptance, follow the relevant rules in [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md). Technical evidence does not grant creative acceptance. Attribution for the copied visual guidance is in [CREDITS.md](./CREDITS.md).

Use this template:

```markdown
## Summary

<smallest useful diagram, diff sketch, changed-asset inventory, or tree>

## Evidence

- **Before:** <comparable capture, output, or failing test, when relevant>
  **After:** <comparable capture, output, or passing test, when relevant>
- **Technical validation:** <verified checks, or what remains unverified>
- **Creative acceptance:** <explicit verdict, pending, or not assessed, when relevant>

## Merge Danger

**Door:** <one-way or two-way>

<optional: practical rollback or compatibility limits>

**Blast Radius:** <one-word description>

<optional: affected maps, assets, shared consumers, references, or save data>

<optional: distinguish intentional authored changes and required generated outputs from incidental generated churn>
```

## Sections

Skip preambles and keep prose brief. Use only evidence needed to explain this change. A PR body is not a new validation report or an approval gate.

### Summary

Lead with what users or agents can do and why it helps, using a concrete workflow in plain language before explaining implementation details; do not make a diagram a prerequisite when short prose is clearer. Distinguish a new tool's limits from behavior changes to existing callers, and describe warnings and explicit risk acceptance without implying an API flag proves human approval.

Pick the smallest view that makes the key point clear.

- Show logic or an algorithm as pseudocode:

```text
on(save)
  if content is unchanged
    return cached result
  write new content
  return fresh result
```

- Show runtime control flow as a call tree:

```text
submitForm
  createSession
    persistPrompt
    launchAgent
  navigateToSession
```

- Show UI or gameplay structure as a component or interaction tree, including only state and boundaries that matter.
- For native content, a shallow map or asset tree, a changed-asset inventory, or a small state/interaction diagram may be clearer than a code diff.
- Show component interaction, control flow, or data flow with Mermaid when that is the shortest useful view.
- Use `diff` when the point is what changes and the surrounding shape already exists. Match the diff to the topic.
- Show a whole block only when most of it is new, omitted context would hide ownership or order, or the user needs a copyable target shape.

Place each visual next to the short text it supports. Keep only the calls, assets, states, maps, and boundaries needed to explain the change.

### Evidence

Use a before-and-after comparison only when it supports the claim. Do not require screenshots, clips, or measurements for every PR.

- For a visual capture, state the relevant viewpoint and settings when they affect comparison.
- For gameplay, state the repeatable input or scenario and starting conditions.
- For performance, include the build, environment, settings, and workload needed to interpret a relevant measurement.
- For content changes, reuse available saved-result and reference checks. A source-code implementation alone does not prove that the intended map or asset was saved correctly.
- Reuse checks already performed for the implementation or review. Do not rerun them just to fill this section. State what each build actually compiles: a Game-target build can pass while excluding an Editor-only module, so it is not evidence that module compiled for Game.
- Separate technical correctness from appearance, feel, or other creative acceptance. Report a user's actual verdict if provided; otherwise say pending or not assessed.
- If no baseline exists or conditions differ, say so rather than implying a controlled comparison. Bind each test to the revision or fixture it actually exercised; separate earlier-revision experiments from final-candidate builds and tests so a shared bullet list does not imply they all used the same code.

### Merge Danger

Describe whether this is a one-way or two-way door. A cheap revert is lower risk; destructive actions and hard-to-reverse decisions may be one-way doors. Describe the practical rollback limits instead of assuming every asset change is irreversible.

Name the affected scope when relevant: maps, assets, shared materials and their consumers, asset references, save compatibility, or migrations. Distinguish authored changes and required generated outputs from incidental generated churn. This explanation does not authorize deleting generated files or changing the approved diff.

The blast radius is the potential scope of impact. Use a concise description grounded in observed consumers and dependencies, not assumed affected maps or assets.
