---
name: gd-to-tickets
description: Use when splitting game work into verifiable tickets.
disable-model-invocation: true
---

# To Tickets

Break an agreed plan, spec, or conversation into tickets whose blockers describe genuine logical dependencies.

If the tracker or configured triage-label vocabulary is missing, resolve the project's existing convention before publication. Do not invent a replacement.

## Process

### 1. Gather context

Work from the conversation. If given a spec path, issue number, or URL, fetch and read its full body and comments. Use the project's domain vocabulary and respect relevant ADRs. For Unreal maps, assets, Editor work, saving, or acceptance, read the relevant sections of [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md) from this skill bucket. Include only relevant approved direction and references, authorized targets, protected content, and existing approval or checkpoint rules.

### 2. Explore the project when useful

If the project has not already been explored and its state affects the tickets, inspect it. Identify genuinely useful prerequisite work, but do not split merely along arbitrary technical layers. Verified map or asset identifiers may define a ticket's authorized target; avoid speculative implementation paths.

### 3. Draft outcome-based slices

A slice delivers one independently demonstrable or reviewable outcome through the layers that outcome actually needs. This may be gameplay, environment or content production, asset preparation, investigation, or an experiment. Do not require every ticket to touch schema, API, UI, and tests.

Size each ticket for a bounded agent session that includes execution, relevant verification, and a usable handoff. Use the work and its real dependencies to choose the boundary; invent no fixed time or token quota.

Keep these separate:

- **Blockers:** only unresolved logical prerequisites. Preserve parent-child hierarchy separately from blocking edges.
- **Resources and ownership:** note required Editor or other shared-resource access and exact file, map, asset, and shared-dependency scope where relevant. The coordinator assigns ownership at dispatch. No logical blockers makes work eligible for dispatch, not guaranteed immediate access.

For shared-Editor work, do not add fake dependency edges just to serialize otherwise independent tasks. The coordinator schedules ownership under the project's existing rules.

Before preview or publication, validate the ticket set as one graph: every in-scope requirement is covered, acceptance is observable and owned by a ticket, all necessary blockers are present, and dependencies are necessary and acyclic.

### 4. Quiz the user

Present a concise numbered summary, not full ticket bodies or every acceptance criterion. For each ticket show:

- **Title**: short descriptive name.
- **Blocked by**: genuine logical blockers, if any.
- **What it delivers**: its independently demonstrable or reviewable outcome.

Ask whether granularity and blocking edges are right and whether tickets should be merged or split. Iterate on this summary until the user approves the breakdown. Do not require review of the full payload or every criterion before publication.

### 5. Publish the tickets

After the user approves the breakdown, publish the approved tickets using the configured tracker. If the user asked only for a draft or review, stop without publication.

- **Local files:** write one file per ticket under `.scratch/<feature-slug>/issues/<NN>-<slug>.md`, numbered from `01` in dependency order, blockers first. Use the local template below.
- **Issue tracker:** publish one issue per ticket in dependency order so blocking relationships can reference real identifiers. Use the platform's native blocking relationship when available; otherwise include a `Blocked by` section. If the source was an existing issue, make each ticket its sub-issue using the tracker convention. Apply the configured `ready-for-agent` triage label unless instructed otherwise. Do not create competing tracker or status vocabulary.

After publication, read every ticket back and verify its body, parent relationship where supported, blocking links, and mapped labels. Report partial failures rather than claiming the whole set succeeded. Do not close or modify a parent issue.

Work the frontier: any ticket whose blockers are all done. For a purely linear chain, that means top to bottom.

<local-ticket-template>

# <NN>: <Ticket title>

**Outcome:** the end-to-end result this ticket makes demonstrable or reviewable.

**Starting state and approved references:** relevant context, or omit when unnecessary.

**Authorized scope and protected content:** exact map, asset, or other target identifiers and exclusions where relevant; omit when unnecessary.

**Resources and ownership:** required Editor or shared-resource access and assigned owner when known; these are not blockers by themselves.

**Blocked by:** ticket numbers or titles for genuine logical blockers, or "None (eligible for dispatch)".

**Acceptance and evidence:** observable ticket-owned criteria and the relevant checks, captures, saved-state or reference checks, measurements, or human judgment.

**Checkpoint and existing approval conditions:** applicable conditions, or omit when unnecessary.

**Status:** ready-for-agent

- [ ] Acceptance criterion

</local-ticket-template>

<issue-template>

## Parent

Reference the parent issue when the source was an existing issue; otherwise omit this section.

## What to build

The end-to-end outcome this ticket makes demonstrable or reviewable, not a layer-by-layer implementation list.

## Starting state and approved references

Relevant context, or omit when unnecessary.

## Authorized scope and protected content

Exact map, asset, or other target identifiers and exclusions where relevant; omit when unnecessary.

## Resources and ownership

Required Editor or shared-resource access and assigned owner when known. These are not logical blockers.

## Acceptance criteria and evidence

Observable criteria owned by this ticket and the relevant checks, captures, saved-state or reference checks, measurements, or human judgment.

## Checkpoint and existing approval conditions

Applicable conditions, or omit when unnecessary.

## Blocked by

References to genuine logical blockers, or "None (eligible for dispatch)". Omit this section when blockers are set as native edges.

</issue-template>

Avoid implementation file paths and code snippets because they go stale. Preserve verified target identifiers when they define scope. A prototype may contribute a snippet only when it encodes a decision more precisely than prose, with a note that it came from the prototype.
