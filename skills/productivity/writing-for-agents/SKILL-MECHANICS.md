# Skill mechanics

The skill-specific branch of [`writing-for-agents`](SKILL.md): what changes when the document is a skill (frontmatter, the invocation choice, and router skills). Everything else about writing it is the universal reference in `SKILL.md`.

## Invocation

Invocation is host-specific. The same skill package can be user-invoked in one host and discoverable by the model in another.

- A **model-invoked** skill is available for automatic selection in hosts that index its description. It remains available for explicit user invocation. The description is a context pointer, with permanent context load in exchange for discoverability. A reference-only skill can also be shared by other skills when the host supports dependency loading. Use the host's documented metadata and discovery behavior.
- A **user-invoked** skill is limited to explicit user invocation only in hosts that enforce that setting. This reduces automatic-discovery load at the cost of human cognitive load. The metadata that expresses this mode is host-specific.

### Host behavior

- **Claude Code**: `disable-model-invocation: true` marks a skill as user-invoked for that host.
- **Codex**: `policy.allow_implicit_invocation: false` in `agents/openai.yaml` expresses the adapter's user-invoked mode.
- **Hermes**: tested Hermes does not enforce either foreign manual-only field. Its own skill index and slash-command behavior determine discovery and explicit invocation. Load another skill's instructions with `skill_view(name="...")`. Loading instructions is not permission to perform that skill's actions.

Choose model-invocation when the target host should discover the skill or when another skill needs to load it. Use user-invocation only when the target host supports and enforces that boundary. Do not treat adapter metadata as portable access control.

Shared reference needed by two user-invoked skills can live in neither in hosts that prevent model-to-skill loading. In that case, put it in a plain file both can point to. In Hermes, `skill_view` can load skill instructions regardless of those foreign flags, so follow Hermes behavior instead of generalizing the restriction.

## Splitting by invocation

The invocation cut of splitting (the sequence cut lives in `SKILL.md`): split off a model-invoked skill when you have a distinct leading word that should trigger it on its own, or another skill must reach it through the target host's dependency mechanism. You pay context load for the new always-loaded description, so that independent reach has to be worth it.

## Router skills

When user-invoked skills multiply past what you can remember, that piled-up cognitive load is cured by a **router skill**: one user-invoked skill that names the others and when to reach for each, so the human has one skill to remember instead of many. Whether the router can load another skill depends on the target host. A host that enforces user-only metadata may let it hint but not load; Hermes can load skill instructions with `skill_view` even when foreign metadata says user-invoked.
