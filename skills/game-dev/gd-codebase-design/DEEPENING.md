# Deepening

Use this guide to assess whether a cluster of shallow modules should be deepened, given its dependencies. The vocabulary is in [SKILL.md](./SKILL.md): module, interface, seam, adapter, depth, leverage, and locality.

## Dependency categories

Classify dependencies before choosing how to test the deepened module. Use a stand-in only when it preserves the behavior the test claims to verify.

### 1. In-process

Pure computation and in-memory state with no I/O. These can often be combined and tested through the resulting interface without an adapter.

### 2. Locally substitutable

Dependencies with a local stand-in, such as an in-memory store. Use the stand-in when it faithfully represents the behavior under test. Keep separate checks for behavior it cannot establish.

### 3. Engine-coupled

Unreal world state, Actor or Component lifecycle, Blueprint behavior, asset references, serialization, physics, Editor operations, or other behavior owned by the engine. Use an available engine-aware test or integration path for the behavior that depends on it. Pure calculations can still be tested separately where useful, but a stand-in does not prove engine lifecycle, saved persistence, reference integrity, or runtime interaction. Record missing engine evidence rather than implying it passed.

For any live Editor operation, use the current target and ownership rules in [the game-development working guidance](../GAME-DEVELOPMENT.md). A design proposal alone does not authorize that operation.

### 4. Remote but owned

Services the project owns across a network. A port and production transport adapter can keep core behavior concentrated when the network is a genuine seam. Use an in-memory adapter for tests only where it preserves the behavior under test.

### 5. True external

Third-party services the project does not control. Inject a real dependency seam when needed; use a mock or test adapter for the external behavior, and retain integration checks for behavior the mock cannot prove.

## Seam discipline

- One adapter can signal a hypothetical seam. Two justified adapters, often production and test, are stronger evidence for it.
- Keep internal seams private to the implementation unless callers genuinely need them.
- Do not expose engine details through a new abstraction merely because they are hard to mock. Use a seam when it improves the actual design and verification.

## Testing strategy: replace only covered behavior

- Add tests through the deepened module's interface for the behavior it owns.
- Remove a former shallow-module test only when its required behavior is genuinely covered by the new test surface.
- Retain distinct lifecycle, persistence, asset-reference, engine-integration, or saved-result checks even when a higher-level test also exists.
- Assert observable outcomes through the relevant interface or engine path, not internal implementation state.
- Tests should survive internal refactoring while still covering the actual behavior claimed.