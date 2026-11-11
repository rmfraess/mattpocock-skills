# Editor viewport flythrough probe. Load inside execute_python:
#   import importlib.util, sys
#   spec = importlib.util.spec_from_file_location('fly', r'<path>/editor_flythrough.py')
#   m = importlib.util.module_from_spec(spec); spec.loader.exec_module(m); sys.modules['fly'] = m
#   m.make_path(cx, cy, exclude_label='QR_PCG_Forest'); m.start('baseline')
# Then, in a later tool call, read the 'PERFFLY <tag>' line from the project log and OUT_DIR/perf-dts-<tag>.json.
import unreal, vibeue, json, math, os

OUT_DIR = os.environ.get('TMPDIR', unreal.Paths.project_saved_dir())
SPEED = 800.0  # cm/s
state = {'t': 0.0, 'dts': [], 'thr': [], 'handle': None, 'tag': '', 'pts': [], 'seg': []}
ues = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem)


def make_path(cx, cy, length=16000, n=41, wiggle=1500, eye=170, exclude_label=None):
    """Ground-following path; exclude the forest actor so traces hit terrain, not crowns."""
    world = ues.get_editor_world()
    acts = unreal.get_editor_subsystem(unreal.EditorActorSubsystem).get_all_level_actors()
    ignore = [a for a in acts if exclude_label and a.get_actor_label() == exclude_label]
    pts = []
    for i in range(n):
        x = cx - length / 2 + i * length / (n - 1); y = cy + wiggle * math.sin(i / 6)
        h = unreal.SystemLibrary.line_trace_single(world, unreal.Vector(x, y, 30000), unreal.Vector(x, y, -5000),
            unreal.TraceTypeQuery.ECC_VISIBILITY, True, ignore, unreal.DrawDebugTrace.NONE, True)
        pts.append((x, y, h.to_tuple()[4].z + eye))
    state['pts'] = pts
    state['seg'] = [math.dist(pts[i][:2], pts[i + 1][:2]) for i in range(n - 1)]


def _pos(d):
    P = state['pts']
    for i, L in enumerate(state['seg']):
        if d <= L:
            a, b, f = P[i], P[i + 1], d / L
            return [a[k] + (b[k] - a[k]) * f for k in range(3)], math.degrees(math.atan2(b[1] - a[1], b[0] - a[0]))
        d -= L
    return None, None


def _tick(dt):
    state['dts'].append(dt); state['t'] += dt
    if len(state['dts']) % 8 == 0:
        j = vibeue.exec_tool('PerfToolset.StatsToolset', 'GetFrameTimings')
        state['thr'].append([j.get(k) for k in ('gameThreadMs', 'renderThreadMs', 'rhiThreadMs', 'gpuMs', 'frameMs')])
    p, yaw = _pos(state['t'] * SPEED)
    if p is None:
        unreal.unregister_slate_post_tick_callback(state['handle'])
        d = sorted(state['dts'][2:])
        json.dump({'dts': state['dts'], 'thr': state['thr']}, open(os.path.join(OUT_DIR, 'perf-dts-%s.json' % state['tag']), 'w'))
        unreal.log('PERFFLY %s frames=%d median=%.1fms p95=%.1fms max=%.1fms over33=%d' % (
            state['tag'], len(d), 1000 * d[len(d) // 2], 1000 * d[int(len(d) * .95)], 1000 * d[-1], sum(x > 0.033 for x in d)))
        return
    ues.set_level_viewport_camera_info(unreal.Vector(*p), unreal.Rotator(roll=0, pitch=-8, yaw=yaw))


def start(tag):
    assert state['pts'], 'call make_path first'
    state.update(t=0.0, dts=[], thr=[], tag=tag)
    state['handle'] = unreal.register_slate_post_tick_callback(_tick)
