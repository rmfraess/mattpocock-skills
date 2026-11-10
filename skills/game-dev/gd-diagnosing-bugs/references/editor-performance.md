# Editor/viewport performance diagnosis (Unreal)

Use when the Editor or a level "feels laggy", stutters while moving, or frame rate regresses after content changes.

## 1. Measure motion, not idle
- Disable background throttling first (`PerformanceService.set_background_throttling(False)`), restore it at the end.
- `PerformanceService.frame_timing()` on a still camera is only the idle baseline. Lag reported "while traversing or moving the camera" often hides from idle readings (idle 7 ms vs 45 ms moving).
- Reproduce with a scripted flythrough: `scripts/editor_flythrough.py` precomputes a ground-following path and moves the level viewport camera from a slate post-tick callback, logging per-frame dt plus a game/render/RHI/GPU split every 8 frames. Run it from `execute_python`, then read the `PERFFLY` log line from a separate call; the callback runs across Editor frames, which a blocking Python loop cannot.
- Fly the same path for every probe, run baseline twice, and treat wall-clock time far beyond the path duration as a sign that frames hit the engine dt clamp.
- A second identical run separates one-off warm-up (shader compile, streaming) from steady cost.
- An Insights trace (`start_trace`/`stop_trace`/`analyse`) gives frame stats and worst frames, not a per-system breakdown; use the thread split to pick the bound thread.

## 2. Inventory the scene before probing
With the bound thread known, dump facts in one call: per-mesh instance counts on PCG/foliage actors, `nanite_settings.enabled`, triangle count and LOD count per mesh, shadow / distance-field / indirect-lighting flags and cull distances on ISM components, actor class counts (look for large hidden recovery stands), and renderer CVars (Lumen, hardware RT, VSM, Nanite). Large instance counts of non-Nanite single-LOD meshes are the first suspect for render-thread spikes.

## 3. Single-variable probes, ranked
- One probe per flight, restored before the next: session CVar via `SystemLibrary.execute_console_command` (e.g. `r.RayTracing.Geometry.InstancedStaticMeshes 0`), or `set_visibility(False)` on a suspect component group. Read back the restored value.
- Hiding a component group that collapses frame time (45 → 18 ms) proves the group is the cost; then test the actual fix (e.g. enable Nanite) with everything visible and rerun the flight twice.
- An unchanged result rules the variable out; say so and move on rather than tuning nearby values.

## 4. Verify the fix did not change the look
- Capture the same camera before and after. For a pixel diff, also diff two captures of the unchanged scene taken ~40 s apart: Lumen/TSR settling after a fast flight can exceed the before/after delta, and only a delta above that noise floor counts as a visual change.
- Enabling Nanite auto-sets `used_with_nanite` on materials and dirties them; save those task-owned materials or the flag is lost on reload. Do not save foreign masters it touches.

## 5. Report
Table of flights (median, frames over 33 ms, worst, bound thread) for baseline, each probe and the fix. State scope: Editor viewport at one site unless PIE/standalone was measured.
