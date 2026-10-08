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

Write the pull-request body only. Keep the base's three sections, brief prose, and smallest-useful-visual approach. Do not publish, merge, commit, push, run checks, or capture new evidence as a side effect of writing. Reuse applicable verified implementation or review evidence; state plainly when a comparison or check is unavailable or unverified.

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
- Reuse checks already performed for the implementation or review. Do not rerun them just to fill this section.
- Separate technical correctness from appearance, feel, or other creative acceptance. Report a user's actual verdict if provided; otherwise say pending or not assessed.
- If no baseline exists or conditions differ, say so rather than implying a controlled comparison.

### Merge Danger

Describe whether this is a one-way or two-way door. A cheap revert is lower risk; destructive actions and hard-to-reverse decisions may be one-way doors. Describe the practical rollback limits instead of assuming every asset change is irreversible.

Name the affected scope when relevant: maps, assets, shared materials and their consumers, asset references, save compatibility, or migrations. Distinguish authored changes and required generated outputs from incidental generated churn. This explanation does not authorize deleting generated files or changing the approved diff.

The blast radius is the potential scope of impact. Use a concise description grounded in observed consumers and dependencies, not assumed affected maps or assets.
