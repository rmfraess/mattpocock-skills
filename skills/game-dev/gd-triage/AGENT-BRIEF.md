# Writing Agent Briefs

An agent brief is the durable specification for an agent-ready issue or pull request. The original item and discussion provide context; the brief states the remaining work and its acceptance criteria.

## Principles

### Durable, but target-aware

Items may wait while the project changes. Describe behavior and contracts rather than brittle implementation instructions. Avoid line numbers and procedural file-edit directions.

A verified map, asset, Blueprint, or other native-content identifier may be named when it identifies the intended task target. Use a necessary reference or path only when it is the clearest verified target identity, not as an instruction about which source file to edit. Reconcile it against the current project before acting; a brief must not freeze today's open map, dirty state, or Editor owner as permanent setup.

### Behavioral, not procedural

Describe what the system or content should do, not how to implement it. State approved direction, protected content, and the boundaries of permitted work when relevant.

### Complete acceptance criteria

Each criterion must be concrete and independently verifiable. Include the starting conditions, input or reproduction scenario, intended outcome, and evidence needed only where they matter to this task.

### Explicit scope boundaries

State what is out of scope so the worker does not expand into adjacent features or alter protected content.

## Template

```markdown
## Agent Brief

**Category:** bug / enhancement
**Summary:** one-line description of what needs to happen

**Current behavior:**
Describe the observed behavior or the current state of the diff.

**Desired behavior:**
Describe the expected result and relevant edge cases.

**Key interfaces or content targets:**
- `TypeName` or contract: what matters and why
- Verified map, asset, or other native target, when needed
- Required starting conditions or references, when needed

**Acceptance criteria:**
- [ ] Specific, testable criterion 1
- [ ] Specific, testable criterion 2

**Out of scope:**
- Protected or unrelated content
- Adjacent feature that is a separate task
```

Only include fields and target references that are relevant. A target identifier helps locate intended content; it does not prescribe a brittle edit path or authorize an Editor operation. Before a live check, reconcile target identity and current state and follow [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md). If the required Editor access is unavailable, state the agent's deliverable and stopping point rather than claiming an unverified result.

## Example: native-content bug

```markdown
## Agent Brief

**Category:** bug
**Summary:** Make the specified door open under the reported gameplay conditions

**Current behavior:**
The reporter identifies `MapName` and `DoorActorName`. Starting at the stated player position and using the reported interaction input, the door remains closed. The current saved-content check confirms that this is the intended target.

**Desired behavior:**
Under the same starting conditions, the interaction opens the intended door and preserves the agreed behavior for locked doors.

**Key interfaces or content targets:**
- `MapName` and `DoorActorName`, reconciled against the current project before live work
- Reported starting condition and interaction input
- Relevant saved asset and reference checks

**Acceptance criteria:**
- [ ] The reported scenario opens the intended door in the agreed game state.
- [ ] The locked-door scenario remains unchanged.
- [ ] The saved result and relevant references verify the intended target.

**Out of scope:**
- Other doors or maps
- Changes to unrelated interaction systems
```

This example names content to identify the task. It does not authorize changing the currently open map or assume a particular Editor owner.

## Example: PR still needing work

For a PR, describe the current state of its diff and the remaining gap, rather than asking the agent to build from scratch.

```markdown
## Agent Brief

**Category:** enhancement
**Summary:** Finish the agreed behavior change in the existing PR

**Current behavior:**
The diff implements the main behavior, but the reported edge case and its verification are still missing.

**Desired behavior:**
The changed behavior meets the accepted contract while the existing default remains unchanged.

**Key interfaces or content targets:**
- The affected behavior contract and verified target, when relevant
- Existing implementation in the diff, without assuming its current structure must remain

**Acceptance criteria:**
- [ ] The primary scenario passes.
- [ ] The reported edge case passes.
- [ ] The existing default behavior remains unchanged.

**Out of scope:**
- Extending the behavior to unrelated targets
- Changing the accepted contract
```

## Writing checks

- Preserve the approved direction and distinguish required changes from optional suggestions.
- Use durable behavioral criteria and verified target identity only when needed.
- Include appropriate code, saved-content, reference, gameplay, visual, or performance evidence for the claim, not every evidence type by default.
- Keep technical checks separate from appearance or feel acceptance. State the agent's stopping point when a human decision remains.
- Do not treat an Editor wait as missing reporter information, a permanent rejection, or an implicit resource reservation.