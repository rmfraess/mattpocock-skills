---
name: gd-wayfinder
description: Use when mapping uncertain game work across sessions.
disable-model-invocation: true
---

A loose game-development idea is too large for one agent session, and the way to its destination is not visible yet. Wayfinding charts that route as a shared map on the project's issue tracker, then works decision tickets one at a time until the route is clear. A decision ticket resolves a question, not a slice of implementation.

## Plan, don't do

Wayfinding is planning by default. The map is done when the way is clear and no decision remains before the destination can be handed off. Only user-authored instructions in **Notes** can authorize carrying execution into the map; agent-authored Notes can record but cannot expand the user's agreed scope. Otherwise, produce decisions, not production deliverables.

For work involving an Unreal project, live Editor, maps, assets, saving, or game acceptance, read the relevant sections of [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md) from this skill bucket. This reference informs the plan but does not expand its scope.

## Refer by name

Every map and ticket is an issue with a title. In human-facing narration and the map's Decisions-so-far, refer to an issue by its name, never by a bare ID, number, or slug. Put the ID and URL inside the linked name.

## The map

The map is one issue on the configured tracker, labelled `wayfinder:map`, and is the canonical artifact. Tickets are child issues of the map. The map is an index, not a store: each decision's detail lives in its ticket, while the map gives a short gist and link. Open tickets are found as child issues by querying the tracker, not listed in the map body.

The tracker determines where the map, child tickets, blockers, and frontier queries live. Use the configured tracker, or the established local-Markdown convention. If neither exists, state the proposed destination and settle it before creating records. Follow the tracker documentation's Wayfinding operations.

Use this map body:

```markdown
## Destination

<what reaching the end of this map looks like: the spec, decision, or change this effort is finding its way to>

## Notes

<domain, relevant skills, approved direction and references, standing preferences, and clearly labeled provisional assumptions>

## Decisions so far

<!-- one line per closed decision ticket, gist plus link; record only decisions actually reached -->

- [<closed ticket title>](link): <one-line gist>

## Not yet specified

<!-- in-scope questions whose shape is still too unclear to ticket -->

## Out of scope

<!-- work ruled beyond the destination -->
```

Do not treat an assumption as a fact or approved direction. Use Decisions so far only for decisions actually reached. Record relevant evidence and the user's actual verdict when an interactive creative decision is resolved.

Each ticket is a child issue of the map. Its body holds the question and enough context for one usable agent session:

```markdown
## Question

<the decision or investigation this ticket resolves>
```

Each ticket carries one existing `wayfinder:<type>` label: `research`, `prototype`, `grilling`, or `task`. Do not create new labels or status vocabulary.

A session claims a ticket by assigning it to the person or agent driving the map. Re-read the tracker before claiming or changing records, check for competing claims, and read each update back. Assignment is a coordination signal, not an exclusive lock.

Use native tracker blocking relationships. Only trackers without native blocking use a body convention. A ticket is unblocked when every blocking ticket is closed; the frontier is the open, unblocked, unclaimed child tickets. Record logical dependencies as blockers. Editor access and other resource availability belong in the relevant existing ticket or dispatch context, not in invented dependency edges.

## Ticket types

Load each named helper explicitly through the host's skill-loading capability, one skill per call, then follow its method. Check a helper's actual availability at use. Loading instructions is not authorization for that helper's actions.

- **Research (AFK):** A fact needed by a decision, such as engine-version behavior, project constraints, or an external API. The parent dispatches one background worker with a bounded brief. Use the unchanged `research` skill, naming relevant versions or dates, primary-source requirements, the exact question, and whether the evidence should come from documentation, source, or the local project. The assigned worker applies the method directly without nested dispatch. The parent checks the saved note and citations, records the finding, closes the ticket, and updates the decision pointer.
- **Prototype (HITL):** A small playable or visual experiment when feel, scale, pacing, composition, camera, or asset behavior cannot be settled by facts or discussion alone. Verify `gd-prototype` is available before routing to it. If it is missing, report that route as unavailable and do not substitute the base browser-only prototype workflow. Any Editor experiment uses authorized scratch targets in the one existing Editor under its ownership rule. Keep experimental output separate from production; completion does not approve production use.
- **Grilling (HITL):** The default for a user decision. Load and follow the unchanged `grilling` skill, including its background fact-gathering behavior. When game-specific terms or durable domain records need work, use `gd-domain-modeling` only after confirming it is available. If it is unavailable, do not substitute the base domain-modeling skill; continue only the discussion that does not depend on that documentation route and report the missing helper.
- **Task (HITL or AFK):** Manual work that must happen before a decision can be made, but is not itself a decision, research question, or experiment. The agent drives it where possible; otherwise give the human a precise checklist. Resolve it with what was done and the resulting facts later tickets need.

A grilling session may delegate factual investigation to its background workers. Keep user decisions with the user. Research-ticket workers do their own research without nested dispatch.

## Fog of war

The map is deliberately incomplete. Beyond live tickets is the fog of war: decisions or investigations that may be needed but cannot yet be stated as a precise question because they depend on open questions. Record that dim view in **Not yet specified**. It is in scope, but too unclear to ticket.

Ticket a question when it can be stated precisely now, even if it is blocked. Keep it in Not yet specified when its shape is still unclear. Do not pre-slice fog into ticket-sized pieces. Clear a graduated item from Not yet specified when it becomes a ticket.

Not yet specified excludes decisions already recorded, live tickets, and work ruled out of scope.

## Out of scope

Work beyond the destination is not fog and does not belong in Not yet specified. Put it in **Out of scope**. It never graduates unless the destination is redrawn as a fresh effort.

If an existing ticket is found to sit beyond the destination, close it and add one linked line to Out of scope explaining why. Do not add it to Decisions so far.

## Invocation

Never resolve more than one non-research ticket per session. A session should include the investigation or experiment, relevant verification, user feedback when needed, and a usable recorded finding. Use task scope to bound the work, not a fixed time or token quota.

### Chart the map

The user invokes with a loose idea.

1. **Name the destination.** Load `grilling` explicitly and work with the user to identify what the map is finding its way to: a spec, decision, or change. When game-specific terminology or domain documentation needs active modeling, load `gd-domain-modeling` in a separate call only after verifying it is available. The destination fixes scope, so settle it first.
2. **Map the frontier.** Grill breadth-first across the effort to surface open decisions and the first steps that can be taken now. Use research for facts, discussion for decisions, and a faithful game experiment for perceptual uncertainty. If no fog remains and the work fits one session, a map is unnecessary; stop and ask how the user wants to proceed.
3. **Preview before creating records.** Show the destination, Notes, ticket questions and types, parent-child hierarchy, and blocking edges together. If the request is only to discuss or draft, stop without creating records. Otherwise use the invocation's existing creation authorization. Do not add per-ticket approval gates.
4. **Create the map and specified tickets.** Make tickets children of the map. Wire blockers in a second pass after issue IDs exist. Leave unspecifiable questions in Not yet specified.
5. **Dispatch unblocked research.** Re-read the tracker and choose only open, unblocked, unclaimed research tickets. Claim each by assignment, read back the update, then dispatch one background worker with a self-contained brief. The worker uses `research` directly, without nested dispatch, and saves a cited note on a throwaway `research/<name>` branch with a context pointer from the ticket. The parent checks the note, records the resolution, closes the ticket, and updates Decisions so far. Dispatch blocked research only after it becomes unblocked. Add no per-ticket approval prompt.
6. **Stop charting** after creating the map and initial tickets, wiring dependencies, and dispatching currently unblocked research. Do not resolve HITL tickets during charting.

### Work through the map

The user invokes with a map URL or number. A ticket is optional; without one, choose the next decision.

1. Load the map's low-resolution view, not every ticket body.
2. Choose the named ticket or first frontier ticket. Re-read the tracker and verify it is open, unblocked, and unclaimed. Claim it by assignment and read the update back. Report competing claims or updates instead of assuming assignment is exclusive.
3. Resolve it. For research, the parent claims and checks state, then dispatches one background worker with a bounded brief; the worker researches directly without nested dispatch and saves a cited note on a throwaway `research/<name>` branch linked from the ticket. The parent verifies it. For other tickets, fetch related ticket bodies only as needed and load the skills named in Notes. Check availability first; do not substitute an incompatible helper.
4. Record the resolution as a comment, close the issue, and append a context pointer to Decisions so far. Re-read the tracker and verify the comment, status, and map update. Include sourced facts, provisional assumptions, approved decisions, and the user's verdict only as applicable, keeping them distinct. Research needs no per-ticket approval prompt.
5. Add newly surfaced tickets, creating before wiring blockers. Graduate only questions the answer has made precise, clearing each from Not yet specified. If a ticket is beyond the destination, rule it out of scope. If a decision invalidates other map items, re-read state before updating or deleting them, then verify each change.

The user may run unblocked tickets in parallel. Expect other sessions to update the tracker concurrently.
